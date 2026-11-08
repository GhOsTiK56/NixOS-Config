{ ... }:

{
  # Firmware support is required by many AMD devices and peripherals.
  hardware.enableRedistributableFirmware = true;

  hardware.graphics = {
    enable = true;

    # Steam and other games may still ship 32-bit graphics components.
    enable32Bit = true;
  };

  # Enable the motherboard I2C controller used by OpenRGB.
  hardware.i2c.enable = true;
  boot.kernelModules = [ "i2c-piix4" ];
  services.hardware.openrgb.enable = true;

  # Allow supported device firmware updates through LVFS.
  services.fwupd.enable = true;
}
