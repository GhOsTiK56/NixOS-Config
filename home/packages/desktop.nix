{ pkgs, freesmlauncher, ... }:

{
  home.packages = with pkgs; [
    telegram-desktop     # Telegram messaging client.
    discord              # All-in-one cross-platform voice and text chat for gamers.
    bitwarden-desktop    # Secure password manager.
    foliate              # E-book reader.
    localsend            # Transfers files between nearby devices over a local network.
    obsidian             # Markdown-based knowledge base and note-taking app.
    qbittorrent          # BitTorrent client.
    flameshot            # Screenshot capture and annotation tool.
    mangohud             # In-game overlay for FPS, frame times and hardware metrics.
    pinta                # Drawing/editing program modeled after Paint.NET.
    onlyoffice-desktopeditors # Office suite that combines text, spreadsheet and presentation editors allowing to create, view and edit local documents.

    freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher

    gnome-extension-manager # Installs and manages GNOME Shell extensions.
    gnome-tweaks         # Advanced GNOME desktop and appearance settings.
    dconf-editor         # GSettings editor for GNOME
  ];
}