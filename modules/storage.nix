{ ... }:

{
  fileSystems."/" = { 
    options = [
      "x-gvfs-show"
    ];
  };

  fileSystems."/mnt/Hard" = {
    device = "/dev/disk/by-uuid/37d17ac1-2176-4c6e-8364-92cd054b7726";
    fsType = "ext4";
    options = [
      "nofail"
      "x-systemd.device-timeout=5s"
      "x-gvfs-show"
    ];
  };

  fileSystems."/mnt/Sata" = {
    device = "/dev/disk/by-uuid/999e3b3a-5d65-41de-b6e7-a64ba2ca21c7";
    fsType = "ext4";
    options = [
      "nofail"
      "x-systemd.device-timeout=5s"
      "x-gvfs-show"
    ];
  };
}
