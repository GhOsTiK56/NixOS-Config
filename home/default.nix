{ zen-browser, ... }:

{
  # Keep this aligned with the Home Manager version used on first installation.
  home.stateVersion = "26.05";

  imports = [
    ./packages.nix
    ./programs.nix
    ./desktop/gnome

    # The browser flake provides its own Home Manager module.
    zen-browser.homeModules.beta
  ];
}