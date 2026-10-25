{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox              # Web browser.
    telegram-desktop     # Telegram messaging client.
    vesktop              # Discord client with support for Vencord.
    obs-studio           # Screen recording and live streaming.
    bitwarden-desktop    # Secure password manager.
    foliate              # E-book reader.
    localsend            # Transfers files between nearby devices over a local network.
    obsidian             # Markdown-based knowledge base and note-taking app.
    qbittorrent          # BitTorrent client.

    # --- Audio | Video ---
    cine                 # Minimalist GTK video player based on MPV.
    recordbox            # Music player and management application.
    easyeffects          # Audio effects and processing for PipeWire applications.
    nicotine-plus        # Soulseek client for peer-to-peer music sharing.
    pavucontrol          # PulseAudio/PipeWire volume control GUI.

    # --- Games ---
    lutris               # Open-source gaming platform for Linux.
    mangohud             # In-game overlay for FPS, frame times and hardware metrics.

    # --- Gnome ---
    gnome-extension-manager # Installs and manages GNOME Shell extensions.
    gnome-tweaks         # Advanced GNOME desktop and appearance settings.
    dconf-editor         # GSettings editor for GNOME
    
    # --- Development ---
    vscode               # Code editor with a large extension ecosystem.
    neovim               # Extensible terminal-based text editor.
    android-studio       # IDE for Android application development.
    ghostty              # GPU-accelerated terminal emulator.
    tmux                 # Keeps terminal sessions running and organizes them into panes.
    yazi                 # Keyboard-driven terminal file manager.

    # --- Flutter & Android Development ---
    android-tools        # CLI tools for Android development (adb, fastboot, etc.).
    cmake                # Cross-platform build system.
    flutter              # UI toolkit for cross-platform applications.
    jdk17                # Java Development Kit required for Android builds.
    ninja                # Small build system focused on speed.
    pkg-config           # Helper tool used when compiling applications.

    # --- Compilers, Runtimes & Build Tools ---
    gcc                  # C and C++ compiler toolchain.
    gnumake              # Automates builds using Makefiles.
    nodejs               # JavaScript runtime.
    python3              # Python interpreter and standard development tools.
    tree-sitter          # Incremental parsing library for syntax highlighting.
    
    # --- Utilities ---
    ffmpeg               # Solution to record, convert and stream audio and video.
    ffmpegthumbnailer    # Generates video thumbnails for file managers.
    flameshot            # Screenshot capture and annotation tool.
    pciutils             # Utilities such as lspci for inspecting PCI devices.
    usbutils             # Utilities such as lsusb for inspecting USB devices.

    # --- CLI Tools, Shell Utilities ---
    ast-grep             # Structural code search and rewriting using syntax trees.
    bat                  # cat alternative with syntax highlighting and Git integration.
    btop                 # Interactive monitor for CPU, memory, disks and processes.
    curl                 # Transfers data using URL-based protocols.
    fastfetch            # Displays system information in the terminal.
    fd                   # Fast, user-friendly alternative to find.
    fzf                  # Fuzzy finder for files, commands and other lists.
    jq                   # Parses, filters and transforms JSON data.
    lazygit              # Terminal UI for browsing Git history and managing repositories.
    lsd                  # ls alternative with colors, icons and directory listings.
    ripgrep              # Fast recursive text search, similar to grep.
    stow                 # Manages symlinks, commonly used for dotfiles.
    tree                 # Displays directories as a tree.
    unzip                # Extracts ZIP archives.
    wget                 # Downloads files over HTTP, HTTPS and FTP.

    # --- Formatters & Linters ---
    shfmt                # Formatter for shell scripts.
    stylua               # Code formatter for Lua.
  ];
}