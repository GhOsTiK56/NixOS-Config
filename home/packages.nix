{ pkgs, freesmlauncher, ... }:

{
  home.packages = with pkgs; [
    # --- External flake packages ---
    freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
    
    # --- Desktop applications ---
    vscode                    # Code editor with a large extension ecosystem.
    ghostty                   # GPU-accelerated terminal emulator.
    neovim                    # Extensible terminal-based text editor.
    yazi                      # Keyboard-driven terminal file manager.
    telegram-desktop          # Telegram messaging client.
    discord                   # Voice, video and text chat client.
    bitwarden-desktop         # Password manager.
    spotify                   # Play music from the Spotify music service.
    proton-vpn                # Official Proton VPN client.
    foliate                   # E-book reader.
    localsend                 # Transfers files between nearby devices over a local network.
    obsidian                  # Markdown-based knowledge base and note-taking app.
    qbittorrent               # BitTorrent client.
    flameshot                 # Screenshot capture and annotation tool.
    mangohud                  # In-game FPS, frame-time and hardware overlay.
    pinta                     # Raster image editor inspired by Paint.NET.
    onlyoffice-desktopeditors # Office suite for documents, spreadsheets and presentations.
    recordbox                 # Music library manager and player.
    easyeffects               # Audio effects and processing for PipeWire.
    nicotine-plus             # Soulseek client for peer-to-peer music sharing.
    pavucontrol               # GUI mixer for PulseAudio-compatible audio servers.
    cine                      # Minimal GTK video player based on MPV.
    obs-studio                # Screen recording and live streaming.
    
    # --- Gnome DE ---
    gnome-extension-manager   # Installs and manages GNOME Shell extensions.
    gnome-tweaks              # Advanced GNOME desktop and appearance settings.
    dconf-editor              # GUI editor for dconf settings.

    # --- Core Runtimes ---
    nodejs                    # JavaScript runtime.
    python3                   # Python interpreter.

    # --- Audio and video ---
    ffmpeg                    # Audio/video recording, conversion and streaming tools.
    ffmpegthumbnailer         # Generates video thumbnails for file managers.
    flac                      # Library and tools for encoding and decoding the FLAC lossless audio file format.
    
    # --- Command-line tools ---
    fastfetch                 # Displays system and hardware information.
    btop                      # Interactive CPU, memory, disk and process monitor.
    lazygit                   # Terminal UI for Git history and repository management.
    stow                      # Manages symlink-based dotfile deployments.
    tree-sitter               # Incremental parsing library used by editor tooling.
    ast-grep                  # Structural code search and rewriting with syntax trees.
    bat                       # cat alternative with syntax highlighting and Git integration.
    curl                      # Transfers data using URL-based protocols.
    fd                        # Fast, user-friendly alternative to find.
    fzf                       # Fuzzy finder for files, commands and other lists.
    jq                        # Parses, filters and transforms JSON data.
    lsd                       # ls alternative with colors and icons.
    ripgrep                   # Fast recursive text search.
    tree                      # Displays directory trees.
    unzip                     # Extracts ZIP archives.
    wget                      # Downloads files over HTTP, HTTPS and FTP.
    pciutils                  # Hardware inspection tools such as lspci.
    usbutils                  # USB inspection tools such as lsusb.
    shfmt                     # Formatter for shell scripts.
    stylua                    # Formatter for Lua.
  ];
}
