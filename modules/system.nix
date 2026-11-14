{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];

      substituters = [
        "https://freesmlauncher.cachix.org"
      ];
      trusted-public-keys = [
        "freesmlauncher.cachix.org-1:Jcp5Q9wiLL+EDv8Mh7c6L9xGk+lXr7/otpKxMOuBuDs="
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  
    kernelPackages = pkgs.linuxPackages_latest;
  
    initrd.kernelModules = [ "amdgpu" ];
  
    resumeDevice = "/dev/disk/by-uuid/99ca6228-85a3-47f1-af55-b3cc6c8b47b0";
  };

  networking = {
    hostName = "NixOS";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Moscow";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings.LC_TIME = "en_GB.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us,ru";
    variant = ",";
    options = "grp:alt_shift_toggle";
  };

  users.users.ghostik = {
    isNormalUser = true;
    description = "Ghostik";
    shell = pkgs.fish;

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

  environment.sessionVariables.XDG_DATA_DIRS = [
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
  ];
}
