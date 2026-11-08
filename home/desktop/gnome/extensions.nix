{ pkgs, ... }:

let
  # Extensions in this list are installed and enabled by dconf below.
  enabledExtensions = with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    better-tray-icons
    compiz-alike-magic-lamp-effect
    compiz-windows-effect
    dash-to-dock
    just-perfection
    power-off-options
    tiling-shell
    weather-oclock
  ];

  # These remain installed so they can be enabled manually from Extension Manager.
  disabledExtensions = with pkgs.gnomeExtensions; [
    vertical-workspaces
    clipboard-indicator
    window-is-ready-remover
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
    # Keep Telegram's tray metadata so the extension can identify its symbolic icons.
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
      window-demands-attention-focus = true;
      startup-status = 0;
    };

    # --- Tiling Shell ---
    "org/gnome/shell/extensions/tilingshell" = {
      show-indicator = false;
      inner-gaps = 6;
      outer-gaps = 6;

      # Keep layouts as structured Nix data so tile proportions are easy to edit.
      layouts-json = builtins.toJSON [
        {
          id = "Layout 2";
          tiles = [
            { x = 0; y = 0; width = 0.22; height = 1; groups = [ 1 ]; }
            { x = 0.22; y = 0; width = 0.56; height = 1; groups = [ 1 2 ]; }
            { x = 0.78; y = 0; width = 0.22; height = 1; groups = [ 2 ]; }
          ];
        }
        {
          id = "496490";
          tiles = [
            { x = 0; y = 0; width = 0.0734375; height = 1; groups = [ 1 ]; }
            { x = 0.0734375; y = 0; width = 0.8531249999999999; height = 0.8625954198473282; groups = [ 2 3 1 ]; }
            { x = 0.9265625; y = 0; width = 0.07343749999999905; height = 1; groups = [ 2 ]; }
            { x = 0.0734375; y = 0.8625954198473282; width = 0.8531249999999999; height = 0.13740458015267176; groups = [ 3 2 1 ]; }
          ];
        }
        {
          id = "Layout 3";
          tiles = [
            { x = 0; y = 0; width = 0.33; height = 1; groups = [ 1 ]; }
            { x = 0.33; y = 0; width = 0.67; height = 1; groups = [ 1 ]; }
          ];
        }
        {
          id = "Layout 4";
          tiles = [
            { x = 0; y = 0; width = 0.67; height = 1; groups = [ 1 ]; }
            { x = 0.67; y = 0; width = 0.33; height = 1; groups = [ 1 ]; }
          ];
        }
      ];
    };
  };
}
