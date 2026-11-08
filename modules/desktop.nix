{ ... }:

{
  # GNOME desktop session and its login manager.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Home Manager writes the user's GNOME settings through dconf.
  programs.dconf.enable = true;

  # Let GNOME applications request screen sharing, file access and portals.
  xdg.portal.enable = true;

  # PipeWire provides the system audio server and PulseAudio compatibility.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    wireplumber.extraConfig."99-disable-suspend" = {
      "monitor.alsa.rules" = [
        {
          matches = [
            { "node.name" = "~alsa_input.*"; }
            { "node.name" = "~alsa_output.*"; }
          ];

          actions = {
            update-props = {
              # Keep idle ALSA devices open instead of suspending them.
              "session.suspend-timeout-seconds" = 0;
            };
          };
        }
      ];
    };
  };
}
