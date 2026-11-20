{ ... }:

{
  hardware.enableRedistributableFirmware = true;

  hardware.graphics = {
    enable = true;

    enable32Bit = true;
  };

  hardware.i2c.enable = true;
  boot.kernelModules = [ "i2c-piix4" ];
  services.hardware.openrgb.enable = true;

  services.fwupd.enable = true;
}
