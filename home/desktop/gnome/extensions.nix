{ pkgs, ... }:

let
  enabledExtensions = with pkgs.gnomeExtensions; [
    better-tray-icons
    blur-my-shell
    clipboard-indicator
    compiz-alike-magic-lamp-effect
    compiz-windows-effect
    dash-to-dock
    icon-matcher
    just-perfection
    power-off-options
    tiling-shell
    weather-oclock
    window-is-ready-remover
  ];

  disabledExtensions = with pkgs.gnomeExtensions; [
    appindicator
    vertical-workspaces
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
      app-configs = builtins.toJSON {
        telegram = {
          priority = 100;
        };
      };

      keep-popup-after-click = true;
      visible-icon-limit = 1;
      icon-size = 22;
      toggle-position = "right";
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

    # --- Tiling Shell ---
    "org/gnome/shell/extensions/tilingshell" = {
      show-indicator = false;
      inner-gaps = 6;
      outer-gaps = 6;

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
  };
}
