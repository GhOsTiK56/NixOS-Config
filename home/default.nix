{ zen-browser, ... }:

{
  home.stateVersion = "26.05";

  imports = [
    ./desktop/gnome.nix

    ./packages/cli.nix
    ./packages/desktop.nix
    ./packages/development.nix
    ./packages/media.nix

    ./programs/git.nix
    ./programs/mpv.nix
    ./programs/zen-browser.nix
    ./programs/zoxide.nix
    
    zen-browser.homeModules.beta
  ];
}