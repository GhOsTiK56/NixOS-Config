{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- IDEs ---
    vscode               # Code editor with a large extension ecosystem.
    neovim               # Extensible terminal-based text editor.
    android-studio       # IDE for Android application development.

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
  ];
}