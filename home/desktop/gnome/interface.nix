{ lib, pkgs, ... }:

let
  inherit (lib.hm) gvariant;

  keyboardSources = [
    (gvariant.mkTuple [ "xkb" "us" ])
    (gvariant.mkTuple [ "xkb" "ru" ])
  ];
in
{
  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Bibata-Modern-Ice";
      monospace-font-name = "Adwaita Mono 11";
      enable-animations = true;
      enable-hot-corners = false;
    };

    "org/gnome/GWeather4" = {
      temperature-unit = "centigrade";
    };

    "org/gnome/desktop/background" = {
      picture-options = "zoom";
      picture-uri = "file:///home/ghostik/.config/background";
      picture-uri-dark = "file:///home/ghostik/.config/background";
    };

    "org/gnome/desktop/input-sources" = {
      sources = keyboardSources;
      mru-sources = keyboardSources;
      xkb-options = [ "grp:alt_shift_toggle" ];
    };

    "org/gnome/desktop/calendar" = {
      week-start-day = "monday";
    };

    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      num-workspaces = 3;
      resize-with-right-button = true;
    };

    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = false;
      edge-tiling = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = 0.13675200000000001;
    };

    "org/gnome/desktop/session" = {
      idle-delay = gvariant.mkUint32 0;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-timeout = 3600;
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/desktop/break-reminders/eyesight" = {
      play-sound = true;
    };

    "org/gnome/desktop/break-reminders/movement" = {
      duration-seconds = gvariant.mkUint32 300;
      interval-seconds = gvariant.mkUint32 1800;
      play-sound = true;
    };

    "org/gnome/desktop/sound" = {
      event-sounds = true;
      theme-name = "__custom";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;

      favorite-apps = [
        "firefox.desktop"
        "zen-beta.desktop"
        "org.telegram.desktop.desktop"
        "md.obsidian.Obsidian.desktop"
        "org.gnome.TextEditor.desktop"
        "org.gnome.Calculator.desktop"
        "org.gnome.Nautilus.desktop"
        "code.desktop"
        "com.mitchellh.ghostty.desktop"
        "android-studio.desktop"
        "AmneziaVPN.desktop"
        "steam.desktop"
        "vesktop.desktop"
        "bitwarden.desktop"
        "com.obsproject.Studio.desktop"
        "org.qbittorrent.qBittorrent.desktop"
        "com.github.wwmm.easyeffects.desktop"
        "com.github.johnfactotum.Foliate.desktop"
        "org.nicotine_plus.Nicotine.desktop"
        "ca.edestcroix.Recordbox.desktop"
        "com.mattjakeman.ExtensionManager.desktop"
        "org.gnome.Settings.desktop"
      ];

      last-selected-power-profile = "performance";
      welcome-dialog-last-shown-version = "50.4";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };
  };
}