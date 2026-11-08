{ pkgs, zapret-src, ... }:

let
  stateDir = "/var/lib/zapret-discord-youtube";

  # The Nix store path changes whenever the locked source revision changes.
  sourceRevision = builtins.hashString "sha256" (toString zapret-src);

  # Keep local service options in one file instead of editing the upstream script.
  zapretConfig = pkgs.writeText "zapret-conf.env" ''
    strategy=general_alt10.bat
    interface=any
    gamefiltertcp=false
    gamefilterudp=false
    firewall_backend=nftables
  '';

  setup = pkgs.writeShellScript "zapret-setup" ''
    set -euo pipefail

    sourceChanged=0

    # Copy the immutable flake source into the writable runtime directory.
    # The upstream script downloads its runtime dependencies into this directory.
    if [ ! -f "${stateDir}/.nix-source-revision" ] || \
       [ "$(cat "${stateDir}/.nix-source-revision")" != "${sourceRevision}" ]; then
      cp -a "${zapret-src}/." "${stateDir}/"

      printf '%s\n' "${sourceRevision}" \
        > "${stateDir}/.nix-source-revision"

      sourceChanged=1
    fi

    chmod +x "${stateDir}/service.sh"

    # Download upstream binaries on first start and whenever the source changes.
    if [ "$sourceChanged" -eq 1 ] || \
       [ ! -x "${stateDir}/nfqws" ] || \
       [ ! -d "${stateDir}/zapret-latest" ]; then
      cd "${stateDir}"
      bash ./service.sh download-deps --default
    fi

    test -x "${stateDir}/nfqws"
    test -d "${stateDir}/zapret-latest"
  '';

  cleanup = pkgs.writeShellScript "zapret-cleanup" ''
    # Remove firewall rules and stop helper processes when the unit exits.
    if [ -x "${stateDir}/service.sh" ]; then
      exec ${pkgs.bash}/bin/bash "${stateDir}/service.sh" kill
    fi
  '';
in
{
  systemd.services.zapret-discord-youtube = {
    description = "Zapret Discord YouTube";

    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];

    # Runtime tools used by service.sh and its dependency downloader.
    path = with pkgs; [
      bash
      coreutils
      curl
      git
      gnugrep
      gnused
      gawk
      gnutar
      gzip
      findutils
      procps
      iproute2
      nftables
    ];

    serviceConfig = {
      # systemd creates /var/lib/zapret-discord-youtube before ExecStartPre.
      StateDirectory = "zapret-discord-youtube";
      WorkingDirectory = stateDir;

      ExecStartPre = "${setup}";
      ExecStart = "${pkgs.bash}/bin/bash ${stateDir}/service.sh run --config ${zapretConfig}";
      ExecStopPost = "${cleanup}";

      Restart = "on-failure";
      RestartSec = "5s";
      TimeoutStartSec = "10min";
      TimeoutStopSec = "30s";
    };
  };
}
