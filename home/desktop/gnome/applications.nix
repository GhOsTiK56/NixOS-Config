{ lib, ... }:

let
  inherit (lib.hm) gvariant;
in
{
  dconf.settings = {
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

    "org/gnome/TextEditor" = {
      highlight-current-line = true;
      show-line-numbers = true;
      show-map = true;
      show-right-margin = false;
      style-scheme = "Adwaita-dark";
      use-system-font = true;
    };

    "com/github/johnfactotum/Foliate" = {
      color-scheme = 4;
    };

    "com/github/johnfactotum/Foliate/library" = {
      view-mode = "grid";
    };

    "com/github/johnfactotum/Foliate/viewer" = {
      fold-sidebar = true;
    };

    "com/github/johnfactotum/Foliate/viewer/font" = {
      default = gvariant.mkUint32 1;
      default-size = gvariant.mkUint32 18;
      minimum-size = gvariant.mkUint32 1;
    };

    "com/github/johnfactotum/Foliate/viewer/view" = {
      gap = 0.05;
      hyphenate = true;
      justify = true;
      line-height = 1.5;
      max-block-size = gvariant.mkUint32 1460;
      max-column-count = gvariant.mkUint32 1;
      max-inline-size = gvariant.mkUint32 1020;
      override-font = false;
    };

    "io/github/diegopvlk/Cine" = {
      audio-languages = "en, ja";
      hwdec = true;
      loop-state = "off";
      save-session = true;
      save-video-position = true;
      subtitle-bg-color = "#97000000";
      subtitle-color = "#ebebeb";
      subtitle-languages = "ru";
      subtitle-scale = 1.0;
      volume = 100;
      thumbnail-preview = true;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 179;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = gvariant.mkTuple [ 26 23 ];
      window-size = gvariant.mkTuple [ 986 438 ];
    };

    "ca/edestcroix/Recordbox" = {
      album-sort = "Date (Most Recent)";
      append-opened-tracks-to-queue = true;
      background-playback = true;
      external-lyrics-filename = "Same as Track";
      external-lyrics-subdirectory = false;
      group-albums = false;
      height = 895;
      image-cache-version = "1";
      is-maximized = false;
      lyrics-save-location = "Always Ask";
      music-directory = "/home/ghostik/Music/Music-HARD";
      playback-notifications = false;
      playback-rate = "x1";
      preferred-library = "artists";
      recoloring-enabled = true;
      restore-to-library = true;
      rg-enabled = false;
      rg-fallback = 0.0;
      rg-mode = "album";
      rg-preamp = 0.0;
      rotate-cover = true;
      round-cover = true;
      show-all-artists = true;
      show-remaining-time = false;
      sync-on-startup = true;
      visualizer-enabled = true;
      watch-library = true;
      width = 1632;
    };
  };
}