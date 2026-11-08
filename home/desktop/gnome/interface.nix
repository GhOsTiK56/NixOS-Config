{ config, lib, pkgs, ... }:

let
  inherit (lib.hm) gvariant;

  keyboardSources = [
    (gvariant.mkTuple [ "xkb" "us" ])
    (gvariant.mkTuple [ "xkb" "ru" ])
  ];

  background = "file://${config.home.homeDirectory}/.config/background";
in
{
  # Set the same cursor theme for GNOME, GTK and XWayland applications.
  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  dconf.settings = {
    # --- Global appearance ---
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

    # --- Keyboard and input ---
    "org/gnome/desktop/input-sources" = {
      sources = keyboardSources;
      mru-sources = keyboardSources;
      xkb-options = [ "grp:alt_shift_toggle" ];
    };

    # --- Window management and workspaces ---
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      num-workspaces = 3;
      resize-with-right-button = true;
    };

    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = false;

      # Tiling Shell provides the tiling behavior and its own shortcut handling.
      edge-tiling = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = 0.13675200000000001;
    };

    # --- Power and session behavior ---
    "org/gnome/desktop/session" = {
      # Zero disables GNOME's idle timeout; power behavior is configured below.
      idle-delay = gvariant.mkUint32 0;
    };

    "org/gnome/desktop/datetime" = {
      # Keep GNOME from changing the timezone configured by NixOS.
      automatic-timezone = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-timeout = 3600;
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    # --- Break reminders ---
    "org/gnome/desktop/break-reminders/eyesight" = {
      play-sound = true;
    };

    "org/gnome/desktop/break-reminders/movement" = {
      duration-seconds = gvariant.mkUint32 300;
      interval-seconds = gvariant.mkUint32 1800;
      play-sound = true;
    };

    # --- Desktop sounds ---
    "org/gnome/desktop/sound" = {
      event-sounds = true;
      theme-name = "__custom";
    };

    # --- GNOME Shell and application dock ---
    "org/gnome/shell" = {
      favorite-apps = [
        "zen-beta.desktop"
        "org.telegram.desktop.desktop"
        "md.obsidian.Obsidian.desktop"
        "spotify.desktop"
        "org.gnome.TextEditor.desktop"
        "com.github.PintaProject.Pinta.desktop"
        "org.gnome.Calculator.desktop"
        "org.gnome.Nautilus.desktop"
        "code.desktop"
        "com.mitchellh.ghostty.desktop"
        "android-studio.desktop"
        "onlyoffice-desktopeditors.desktop"
        "proton.vpn.app.gtk.desktop"
        "AmneziaVPN.desktop"
        "org.freesmlauncher.FreesmLauncher.desktop"
        "steam.desktop"
        "discord.desktop"
        "bitwarden.desktop"
        "com.obsproject.Studio.desktop"
        "com.github.johnfactotum.Foliate.desktop"
        "ca.edestcroix.Recordbox.desktop"
      ];

      last-selected-power-profile = "performance";
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };
  };
}
