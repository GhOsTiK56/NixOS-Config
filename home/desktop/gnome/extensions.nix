{ pkgs, ... }:

let
  enabledExtensions = with pkgs.gnomeExtensions; [
    better-tray-icons
    blur-my-shell
    clipboard-indicator
    compiz-windows-effect
    icon-matcher
    just-perfection
    power-off-options
    simple-taskbar
    tiling-shell
    wallpaper-slideshow
    window-is-ready-remover
  ];

  disabledExtensions = with pkgs.gnomeExtensions; [
    compiz-alike-magic-lamp-effect
    dash-to-dock
  ];

  allExtensions = enabledExtensions ++ disabledExtensions;
in
{
  programs.gnome-shell = {
    enable = true;
    extensions = map (package: { inherit package; }) allExtensions;
  };

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = map (extension: extension.extensionUuid) enabledExtensions;
    };

    # --- Better Tray Icons ---
    "org/gnome/shell/extensions/bettertrayicons" = {
      keep-popup-after-click = true;
      visible-icon-limit = 0;
      icon-size = 22;
      toggle-position = "right";
    };

    # --- Compiz Windows Effect ---
    "org/gnome/shell/extensions/com/github/hermes83/compiz-windows-effect" = {
      maximize-effect = false;
    };

    # --- Dash to Dock ---
    "org/gnome/shell/extensions/dash-to-dock" = {
      show-mounts = false;
      show-trash = false;
      hide-tooltip = true;
      hot-keys = false;
      click-action = "minimize-or-previews";
      custom-theme-shrink = true;
    };

    # --- Just Perfection ---
    "org/gnome/shell/extensions/just-perfection" = {
      quick-settings-night-light = false;
      events-button = false;
      weather = false;
      world-clock = false;
      window-demands-attention-focus = false;
      startup-status = 0;
    };

    # --- Simple Taskbar ---
    "org/gnome/shell/extensions/simple-taskbar" = {
      active-panel-mode = "default-panel";
      grid-alt-tab-enabled = false;
      gnome-start-button-visible = true;
      icon-size = 50;
      show-progress-bars = true;
      application-click-animation = "enlarge";
      animate-appicon-hover-animation-type = "simple";
      window-minimize-effect = "magic-lamp";
      running-indicator-size = 5;
    };

    "org/gnome/shell/extensions/simple-taskbar/dock" = {
      dock-show-locations = false;
    };

    # --- Tiling Shell ---
    "org/gnome/shell/extensions/tilingshell" = {
      show-indicator = false;

      layouts-json = builtins.toJSON [
        {
          id = "Layout 1";
          tiles = [
            { x = 0; y = 0; width = 1; height = 0.93; groups = [ 2 3 1 ]; }
            { x = 0; y = 0.93; width = 1; height = 0.07; groups = [ 3 2 1 ]; }
          ];
        }
      ];
    };

    # --- Wallpapers Slideshow ---
    "org/gnome/shell/extensions/azwallpaper" = {
      slideshow-directory = "/home/ghostik/Pictures/Wallpapers";
    };
  };
}
