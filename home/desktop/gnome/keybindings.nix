{
  dconf.settings = {
    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [];
      toggle-tiled-right = [];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      maximize = [];
      unmaximize = [];
      minimize = [ "<Super>s" ];

      move-to-workspace-down = [ "<Control><Shift><Alt>Down" ];
      move-to-workspace-up = [ "<Control><Shift><Alt>Up" ];

      move-to-workspace-left = [
        "<Super><Shift>KP_Prior"
        "<Super><Shift><Alt>Left"
        "<Control><Shift><Alt>Left"
        "<Super><Shift>Page_Up"
      ];

      move-to-workspace-right = [
        "<Super><Shift>KP_Next"
        "<Super><Shift><Alt>Right"
        "<Control><Shift><Alt>Right"
        "<Super><Shift>Page_Down"
      ];

      switch-to-workspace-down = [ "<Control><Alt>Down" ];
      switch-to-workspace-up = [ "<Control><Alt>Up" ];
      switch-to-workspace-left = [
        "<Control><Super>h"
        "<Super>Page_Up"
      ];
      switch-to-workspace-right = [
        "<Control><Super>l"
        "<Super>Page_Down"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];

      screensaver = [ "<Alt><Super>l" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Terminal";
      command = "ghostty";
      binding = "<Super>Return";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "File Explorer";
      command = "nautilus";
      binding = "<Super>e";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Screenshot";
      command = "flameshot gui";
      binding = "Print";
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ "<Control>Print" ];
      toggle-quick-settings = [ "<Super>i" ];
    };
  };
}