{ ... }:

{
  programs.git = {
    enable = true;

    settings.user = {
      name = "Ghostik";
      email = "ghostik.tech@gmail.com";
    };
  };

  programs.mpv = {
    enable = true;

    config = {
      vo = "gpu-next";
      gpu-api = "opengl";
      gpu-context = "wayland";
      hwdec = "auto-safe";

      profile = "high-quality";

      sub-font = "Adwaita Sans SemiBold";
      sub-ass-override = "scale";
      blend-subtitles = "yes";
      demuxer-mkv-subtitle-preroll = "yes";

      target-prim = "bt.709";
      target-trc = "bt.1886";

      dither = "error-diffusion";
      deband = "yes";
      deband-iterations = "2";

      tone-mapping = "bt.2446a";
      inverse-tone-mapping = "no";

      target-colorspace-hint = "no";

      osc = "no";
      title-bar = "no";
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}