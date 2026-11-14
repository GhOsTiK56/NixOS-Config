{ zen-browser, ... }:

{
  home.stateVersion = "26.05";

  imports = [
    ./packages.nix
    ./programs.nix
    ./desktop/gnome

    zen-browser.homeModules.beta
  ];
}