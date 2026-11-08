{ config, lib, ... }:

let
  inherit (lib.hm) gvariant;
  homeDirectory = config.home.homeDirectory;
in
{
  dconf.settings = {
    # --- Files and file management ---
    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "medium";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      show-create-link = true;
      show-delete-permanently = true;
      show-image-thumbnails = "always";
    };

    # --- GNOME Text Editor ---
    "org/gnome/TextEditor" = {
      highlight-current-line = true;
      show-line-numbers = true;
      show-map = true;
      show-right-margin = false;
      style-scheme = "Adwaita-dark";
      use-system-font = true;
    };

    # --- Cine video player ---
    "io/github/diegopvlk/Cine" = {
      audio-languages = "en, ja";
      hwdec = true;
      loop-state = "off";
      save-session = true;
      save-video-position = true;
      subtitle-languages = "ru";
      thumbnail-preview = true;
    };
  };
}
