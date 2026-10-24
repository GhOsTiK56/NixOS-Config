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
      hwdec = "auto-safe";         
      
      vo = "gpu-next";             
      
      gpu-api = "opengl";          
      gpu-context = "wayland";

      dither-depth = "auto";       
      sub-ass-override = "scale";     
      # sub-ass-vsfilter-blur-compat = false; 
      blend-subtitles = "yes";        
      demuxer-mkv-subtitle-preroll = "yes"; 

      target-colorspace-hint = false; 
      tone-mapping = "bt.2446a";      
      # target-peak = 200; 
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}