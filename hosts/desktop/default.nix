{ ... }:

{
  # Keep this value at the release used when the system was first installed.
  # It controls compatibility defaults and is not an upgrade target.
  system.stateVersion = "26.05";

  imports = [
    ./hardware-configuration.nix

    ../../modules/system.nix
    ../../modules/hardware.nix
    ../../modules/desktop.nix
    ../../modules/storage.nix

    ../../modules/services/zapret.nix
    ../../modules/services/tg-ws-proxy.nix
  ];
}