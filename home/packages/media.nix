{ pkgs, ... }:

{
  home.packages = with pkgs; [
    recordbox            # Music player and management application.
    easyeffects          # Audio effects and processing for PipeWire applications.
    nicotine-plus        # Soulseek client for peer-to-peer music sharing.
    pavucontrol          # PulseAudio/PipeWire volume control GUI.
    cine                 # Minimalist GTK video player based on MPV.
    obs-studio           # Screen recording and live streaming.
    ffmpeg               # Solution to record, convert and stream audio and video.
    ffmpegthumbnailer    # Generates video thumbnails for file managers.
  ];
}