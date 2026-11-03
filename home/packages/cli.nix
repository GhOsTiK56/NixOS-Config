{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- Terminal ---
    ghostty              # GPU-accelerated terminal emulator.
    tmux                 # Keeps terminal sessions running and organizes them into panes.
    yazi                 # Keyboard-driven terminal file manager.

    # --- CLI Tools ---
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

    # --- System Utilities ---
    pciutils             # Utilities such as lspci for inspecting PCI devices.
    usbutils             # Utilities such as lsusb for inspecting USB devices.

    # --- Formatters & Linters ---
    shfmt                # Formatter for shell scripts.
    stylua               # Code formatter for Lua.
  ];
}