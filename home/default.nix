{ zen-browser, ... }:

{
  home.stateVersion = "26.05";

  imports = [
    ./packages.nix
    ./programs.nix
    ./desktop/gnome.nix
    ./services/tg-ws-proxy.nix

    zen-browser.homeModules.beta
  ];
}