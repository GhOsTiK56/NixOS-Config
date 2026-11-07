{ pkgs, ... }:

let
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
    vertical-workspaces
    weather-oclock
  ];

  disabledExtensions = with pkgs.gnomeExtensions; [
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
      enabled-extensions =
        map (extension: extension.extensionUuid) enabledExtensions;
    };

    "org/gnome/shell/extensions/bettertrayicons" = {
      app-config-sync-meta = builtins.toJSON {
        entries = {
          # openrgb-wrapped = { m = 1794036502858; h = "3fe62c01"; };
          # qbittorrent     = { m = 1794037797903; h = "1c0431ec"; };
          # easyeffects     = { m = 1794036501058; h = "cf9e8dc0"; };
          telegram        = { m = 1794037797903; h = "8c9b820d"; };
          # "org.chromium.chromium" = { m = 1794036558172; h = "af6ce817"; };
          # steam           = { m = 1794036502858; h = "adbaaa56"; };
        };
        tombstones = {};
      };

      app-configs = builtins.toJSON {
        # openrgb-wrapped = {
        #   title = ".openrgb-wrapped";
        #   cached_icon_path = "/home/ghostik/.cache/bettertrayicons/icons/openrgb-wrapped.png";
        #   priority = 20;
        # };
        # qbittorrent = {
        #   title = "qBittorrent";
        #   cached_icon_path = "/home/ghostik/.cache/bettertrayicons/icons/qbittorrent.png";
        #   priority = 50;
        # };
        # easyeffects = {
        #   title = "easyeffects";
        #   detected_icon = "com.github.wwmm.easyeffects-symbolic";
        #   seen_icons = [ "com.github.wwmm.easyeffects-symbolic" ];
        #   priority = 10;
        # };
        telegram = {
          title = "TelegramDesktop";
          detected_icon = "org.telegram.desktop-symbolic";
          seen_icons = [ "org.telegram.desktop-symbolic" "org.telegram.desktop-mute-symbolic" ];
          priority = 100;
        };
        # "org.chromium.chromium" = {
        #   title = "org.chromium.chromium";
        #   icon_theme_path = "/tmp/org.chromium.Chromium.7Yzrdt";
        #   cached_icon_path = "/home/ghostik/.cache/bettertrayicons/icons/org.chromium.chromium.png";
        #   priority = 40;
        # };
        # steam = {
        #   title = "Steam";
        #   detected_icon = "steam_tray_mono";
        #   icon_theme_path = "/home/ghostik/.local/share/Steam/public";
        #   seen_icons = [ "steam_tray_mono" ];
        #   priority = 30;
        #   is_xembed = true;
        # };
      };

      enable-custom-toggle-style = false;
      enable-symbolic-icons = false;
      enable-wine-support = true;
      icon-size = 22;
      keep-popup-after-click = false;
      preview-show-margin = false;
      preview-show-padding = false;
      toggle-icon-size = 20;
      toggle-inherit-icon-style = false;
      toggle-position = "right";
      tray-order = 0;
      tray-position = "right";
      visible-icon-limit = 1;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = true;
      background-opacity = 0.8;
      click-action = "minimize-or-previews";
      custom-background-color = false;
      custom-theme-shrink = true;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      hide-tooltip = false;
      hot-keys = false;
      icon-size-fixed = false;
      intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
      disable-overview-on-startup = false;
      preview-size-scale = 0.0;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "DP-1";
      show-apps-at-top = false;
      show-mounts = false;
      show-trash = false;
      transparency-mode = "DEFAULT";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accent-color-icon = false;
      accessibility-menu = true;
      activities-button = true;
      animation = 6;
      background-menu = true;
      calendar = true;
      clock-menu = true;
      dash = true;
      dash-app-running = true;
      dash-separator = true;
      events-button = false;
      keyboard-layout = true;
      overlay-key = true;
      panel = true;
      panel-notification-icon = true;
      power-icon = true;
      quick-settings = true;
      quick-settings-dark-mode = true;
      quick-settings-night-light = false;
      ripple-box = true;
      startup-status = 0;
      weather = false;
      window-demands-attention-focus = true;
      window-menu = true;
      window-menu-take-screenshot-button = true;
      window-picker-icon = true;
      workspace-peek = true;
      world-clock = false;
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      rounded-blur-found = false;
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.6;
      sigma = 30;
    };

    # "org/gnome/shell/extensions/blur-my-shell/applications" = {
    #   pipeline = "pipeline_default";
    #   blur = true;
    #   corner-when-maximized = false;
    #   dynamic-opacity = false;
    #   opacity = 255;
    #   static-blur = true;
    #   whitelist = [ "zen-beta" ];
    # };

    "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.6;
      pipeline = "pipeline_default_rounded";
      sigma = 30;
      static-blur = true;
      style-dash-to-dock = 0;
      override-background = true;
      unblur-in-overview = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      pipeline = "pipeline_default";
      style-components = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.6;
      corner-radius = 0;
      pipeline = "pipeline_default";
      sigma = 30;
      force-light-text = false;
      override-background = true;
      override-background-dynamically = false;
      static-blur = true;
      style-panel = 0;
      unblur-in-overview = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/popup" = {
      blur = true;
      override-background = true;
      pipeline = "pipeline_default_rounded";
      static-blur = true;
    };

    "org/gnome/shell/extensions/appindicator" = {
      icon-brightness = 0.0;
      icon-contrast = 0.0;
      icon-opacity = 255;
      icon-saturation = 0.0;
      icon-size = 22;
      compact-mode-enabled = true;
      tray-pos = "right";
    };

    "org/gnome/shell/extensions/com/github/hermes83/compiz-windows-effect" = {
      friction = 1.5;
      mass = 80.0;
      maximize-effect = false;
      preset = "S";
      resize-effect = false;
      speedup-factor-divider = 6.0;
      spring-k = 1.0;
      x-tiles = 6.0;
      y-tiles = 6.0;
      last-version = 33;
    };

    "org/gnome/shell/extensions/tilingshell" = {
      edge-tiling-mode = "default";
      enable-autotiling = false;
      enable-blur-selected-tilepreview = false;
      enable-blur-snap-assistant = false;
      enable-tiling-system = true;
      enable-tiling-system-windows-suggestions = false;
      enable-window-border = false;
      inner-gaps = 6;
      layouts-json = "[{\"id\":\"Layout 2\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.22,\"height\":1,\"groups\":[1]},{\"x\":0.22,\"y\":0,\"width\":0.56,\"height\":1,\"groups\":[1,2]},{\"x\":0.78,\"y\":0,\"width\":0.22,\"height\":1,\"groups\":[2]}]},{\"id\":\"496490\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.0734375,\"height\":1,\"groups\":[1]},{\"x\":0.0734375,\"y\":0,\"width\":0.8531249999999999,\"height\":0.8625954198473282,\"groups\":[2,3,1]},{\"x\":0.9265625,\"y\":0,\"width\":0.07343749999999905,\"height\":1,\"groups\":[2]},{\"x\":0.0734375,\"y\":0.8625954198473282,\"width\":0.8531249999999999,\"height\":0.13740458015267176,\"groups\":[3,2,1]}]},{\"id\":\"Layout 3\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.33,\"height\":1,\"groups\":[1]},{\"x\":0.33,\"y\":0,\"width\":0.67,\"height\":1,\"groups\":[1]}]},{\"id\":\"Layout 4\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.67,\"height\":1,\"groups\":[1]},{\"x\":0.67,\"y\":0,\"width\":0.33,\"height\":1,\"groups\":[1]}]}]";
      outer-gaps = 6;
      overridden-settings = "{\"org.gnome.mutter.keybindings\":{\"toggle-tiled-right\":\"['<Super>Right']\",\"toggle-tiled-left\":\"['<Super>Left']\"},\"org.gnome.desktop.wm.keybindings\":{\"maximize\":\"['<Super>Up']\",\"unmaximize\":\"['<Super>Down', '<Alt>F5']\"},\"org.gnome.mutter\":{\"edge-tiling\":\"true\"}}";
      quarter-tiling-threshold = 30;
      raise-together = false;
      selected-layouts = [
        [ "Layout 2" ]
        [ "Layout 2" ]
        [ "Layout 2" ]
      ];
      show-indicator = false;
      snap-assistant-threshold = 10;
      window-use-custom-border-color = false;
      last-version-name-installed = "17.3";
    };

    "org/gnome/shell/extensions/vertical-workspaces" = {
      aaa-loading-profile = true;
      activate-settings-window = 2;
      always-activate-selected-window = false;
      animation-speed-factor = 131;
      app-display-module = true;
      app-favorites-module = true;
      app-folder-close-button = true;
      app-folder-order = 0;
      app-folder-remove-button = 1;
      app-grid-active-preview = false;
      app-grid-animation = 4;
      app-grid-bg-blur-sigma = 300;
      app-grid-bg-brightness = 50;
      app-grid-columns = 0;
      app-grid-content = 2;
      app-grid-folder-center = true;
      app-grid-folder-columns = 0;
      app-grid-folder-icon-grid = 3;
      app-grid-folder-icon-size = -1;
      app-grid-folder-rows = 0;
      app-grid-folder-spacing = 12;
      app-grid-icon-size = -1;
      app-grid-incomplete-pages = false;
      app-grid-names = 1;
      app-grid-order = 0;
      app-grid-orientation = 0;
      app-grid-page-height-scale = 90;
      app-grid-page-width-scale = 85;
      app-grid-performance = false;
      app-grid-remember-page = false;
      app-grid-rows = 0;
      app-grid-show-package-type = 1;
      app-grid-show-page-arrows = true;
      app-grid-show-page-indicators = true;
      app-grid-spacing = 30;
      app-menu-close-wins-ws = true;
      app-menu-force-quit = true;
      app-menu-move-app = true;
      app-menu-window-tmb = true;
      center-app-grid = false;
      center-dash-to-ws = false;
      center-search = true;
      click-empty-close = false;
      close-ws-button-mode = 2;
      dash-bg-color = 1;
      dash-bg-gs3-style = false;
      dash-bg-opacity = 20;
      dash-bg-radius = 0;
      dash-icon-scroll = 2;
      dash-isolate-workspaces = false;
      dash-max-icon-size = 0;
      dash-module = true;
      dash-position = 2;
      dash-position-adjust = 0;
      dash-show-windows-before-activation = 0;
      enable-page-shortcuts = true;
      favorites-notify = 1;
      highlighting-style = 1;
      hot-corner-action = 0;
      hot-corner-fullscreen = false;
      hot-corner-position = 0;
      hot-corner-ripples = true;
      layout-module = true;
      message-tray-module = true;
      new-window-focus-fix = false;
      new-window-monitor-fix = false;
      notification-position = 1;
      osd-position = 6;
      osd-window-module = true;
      overlay-key-module = true;
      overlay-key-primary = 1;
      overlay-key-secondary = 1;
      overview-bg-blur-sigma = 300;
      overview-bg-brightness = 50;
      overview-esc-behavior = 0;
      overview-mode = 0;
      overview-select-window = 0;
      overview-sort-windows = 0;
      panel-module = true;
      panel-overview-style = 1;
      panel-position = 0;
      panel-visibility = 0;
      running-dot-style = 0;
      search-app-grid-mode = 1;
      search-bg-brightness = 40;
      search-controller-module = true;
      search-fuzzy = false;
      search-icon-size = 0;
      search-include-settings = true;
      search-max-results-rows = 5;
      search-module = true;
      search-results-bg-style = 0;
      search-view-animation = 0;
      search-width-scale = 100;
      search-windows-icon-scroll = 1;
      sec-wst-position-adjust = 0;
      secondary-ws-preview-scale = 95;
      secondary-ws-preview-shift = false;
      secondary-ws-thumbnail-scale = 8;
      secondary-ws-thumbnails-position = 2;
      show-app-icon-position = 1;
      show-overview-background = 1;
      show-search-entry = false;
      show-ws-preview-bg = true;
      show-ws-switcher-bg = true;
      show-wst-labels = 0;
      show-wst-labels-on-hover = true;
      smooth-overview-animation = true;
      startup-state = 1;
      swipe-tracker-module = true;
      win-attention-handler-module = true;
      win-preview-close-button = 1;
      win-preview-height-compensation = 80;
      win-preview-icon-size = 1;
      win-preview-mid-mouse-btn-action = 0;
      win-preview-sec-mouse-btn-action = 3;
      win-title-position = 0;
      window-attention-mode = 0;
      window-icon-click-action = 1;
      window-manager-module = true;
      window-preview-module = true;
      workspace-animation = 1;
      workspace-animation-module = true;
      workspace-module = true;
      workspace-switcher-animation = 0;
      workspace-switcher-popup-module = true;
      ws-max-spacing = 30;
      ws-preview-bg-radius = 30;
      ws-preview-scale = 95;
      ws-sw-popup-h-position = 50;
      ws-sw-popup-mode = 1;
      ws-sw-popup-v-position = 95;
      ws-switcher-ignore-last = false;
      ws-switcher-mode = 0;
      ws-switcher-wraparound = false;
      ws-thumbnail-scale = 13;
      ws-thumbnail-scale-appgrid = 13;
      ws-thumbnail-scale-search = 13;
      ws-thumbnails-full = false;
      ws-thumbnails-position = 5;
      wst-position-adjust = 0;
    };

    "org/gnome/shell/extensions/weather-oclock" = {
      weather-after-clock = false;
    };
  };
}