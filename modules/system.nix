{ pkgs, ... }:

{
  # Allow packages with non-free licenses, such as Steam and proprietary tools.
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      # Enable the modern CLI and flake-based configuration management.
      experimental-features = [ "nix-command" "flakes" ];

      # Binary cache used by FreeSM Launcher.
      substituters = [
        "https://freesmlauncher.cachix.org"
      ];
      trusted-public-keys = [
        "freesmlauncher.cachix.org-1:Jcp5Q9wiLL+EDv8Mh7c6L9xGk+lXr7/otpKxMOuBuDs="
      ];
    };

    gc = {
      # Remove old generations' unreachable store paths once a week.
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    optimise = {
      # Deduplicate identical store files to reduce disk usage.
      automatic = true;
      dates = [ "weekly" ];
    };
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Load the AMD GPU driver early during boot.
    initrd.kernelModules = [ "amdgpu" ];

    # Use the swap partition as the hibernation resume device.
    resumeDevice = "/dev/disk/by-uuid/99ca6228-85a3-47f1-af55-b3cc6c8b47b0";
  };

  networking = {
    hostName = "NixOS";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Moscow";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    # GNOME follows the locale's calendar conventions; en_GB starts weeks on Monday.
    # LC_TIME changes date/time formatting while keeping the interface in US English.
    extraLocaleSettings.LC_TIME = "en_GB.UTF-8";
  };

  # Configure the system keyboard layout, including the display manager.
  services.xserver.xkb = {
    layout = "us,ru";
    variant = ",";
    options = "grp:alt_shift_toggle";
  };

  users.users.ghostik = {
    isNormalUser = true;
    description = "Ghostik";
    shell = pkgs.fish;

    # These groups grant administrative access, NetworkManager control,
    # I2C device access (OpenRGB), and KVM access for virtualization.
    extraGroups = [
      "wheel"
      "networkmanager"
      "i2c"
      "kvm"
    ];
  };

  programs = {
    fish.enable = true;
    amnezia-vpn.enable = true;
    steam.enable = true;
    gamemode.enable = true;
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      corefonts       # Microsoft's TrueType core fonts for the Web.
      vista-fonts     # Calibri, Cambria, Candara, Consolas, Constantia and Corbel.
    ];
  };

  # Make GTK3 and GNOME settings schemas available to graphical applications.
  # sessionVariables are exported by PAM to the whole desktop session; extraInit
  # only affects shell initialization and therefore is not suitable for this fix.
  environment.sessionVariables.XDG_DATA_DIRS = [
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
  ];
}
