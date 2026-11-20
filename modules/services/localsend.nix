{ ... }:

{
  networking.firewall = {
    enable = true;

    interfaces."enp3s0" = {
      allowedTCPPorts = [
        53317
      ];

      allowedUDPPorts = [
        53317
      ];
    };
  };
}