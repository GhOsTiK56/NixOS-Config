{ pkgs, zapret-src, ... }:

let
  stateDir = "/var/lib/zapret-discord-youtube";
  sourceRevision = builtins.hashString "sha256" (toString zapret-src);

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

    if [ ! -f "${stateDir}/.nix-source-revision" ] || \
       [ "$(cat "${stateDir}/.nix-source-revision")" != "${sourceRevision}" ]; then

      cp -a "${zapret-src}/." "${stateDir}/"

      printf '%s\n' "${sourceRevision}" \
        > "${stateDir}/.nix-source-revision"

      sourceChanged=1
    fi

    chmod +x "${stateDir}/service.sh"

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
    if [ -x "${stateDir}/service.sh" ]; then
      exec ${pkgs.bash}/bin/bash "${stateDir}/service.sh" kill
    fi
  '';

in
{
  systemd.services.zapret-discord-youtube = {
    description = "Zapret Discord YouTube";

    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

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
      Type = "simple";

      StateDirectory = "zapret-discord-youtube";
      WorkingDirectory = stateDir;

      ExecStartPre = "${setup}";

      ExecStart =
        "${pkgs.bash}/bin/bash "
        + "${stateDir}/service.sh run "
        + "--config ${zapretConfig}";

      ExecStopPost = "${cleanup}";

      Restart = "on-failure";
      RestartSec = "5s";
      TimeoutStopSec = "30s";
    };
  };
}
