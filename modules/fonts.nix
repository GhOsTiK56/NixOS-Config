{ pkgs, ... }:

{
  fonts.enableDefaultPackages = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    corefonts          # Microsoft's TrueType core fonts for the Web.
    vista-fonts        # Calibri, Cambria, Candara, Consolas, Constantia, Corbel.
  ];
}