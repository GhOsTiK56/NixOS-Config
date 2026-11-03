{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox              # Web browser.
    telegram-desktop     # Telegram messaging client.
    vesktop              # Discord client with support for Vencord.
    bitwarden-desktop    # Secure password manager.
    foliate              # E-book reader.
    localsend            # Transfers files between nearby devices over a local network.
    obsidian             # Markdown-based knowledge base and note-taking app.
    qbittorrent          # BitTorrent client.
    flameshot            # Screenshot capture and annotation tool.
    mangohud             # In-game overlay for FPS, frame times and hardware metrics.

    gnome-extension-manager # Installs and manages GNOME Shell extensions.
    gnome-tweaks         # Advanced GNOME desktop and appearance settings.
    dconf-editor         # GSettings editor for GNOME
  ];
}