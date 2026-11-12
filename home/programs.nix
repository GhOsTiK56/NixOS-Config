{ ... }:

{
  # --- Git identity and defaults ---
  programs.git = {
    enable = true;
    settings.user = {
      name = "Ghostik";
      email = "ghostik.tech@gmail.com";
    };
  };

  # --- Shell navigation ---
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  # --- Web browser ---
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  # --- Video player ---
  programs.mpv = {
    enable = true;

    config = {
      # Use the modern renderer with the native Wayland context.
      vo = "gpu-next";
      gpu-api = "opengl";
      gpu-context = "wayland";
      hwdec = "auto-safe";
      profile = "high-quality";

      # Subtitle appearance and timing.
      sub-font = "Adwaita Sans SemiBold";
      sub-ass-override = "scale";
      blend-subtitles = "yes";
      demuxer-mkv-subtitle-preroll = "yes";

      # Use Rec. 709 / BT.1886 as the output color target.
      target-prim = "bt.709";
      target-trc = "bt.1886";
      dither = "error-diffusion";
      deband = "yes";
      deband-iterations = "2";
      tone-mapping = "bt.2446a";
      inverse-tone-mapping = "no";
      target-colorspace-hint = "auto";

      # Hide MPV's on-screen controller and the window title bar.
      osc = "no";
      title-bar = "no";
    };
  };
}
