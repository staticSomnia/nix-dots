{
  flake.modules.nixos.networking = {
    networking = {
      networkmanager.enable = true;
      networkmanager.dns = "none";
      nameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
      hostName = "reverie";
      firewall = {
        trustedInterfaces = [
          # config.services.tailscale.interfaceName
        ];

        allowedTCPPorts = [
          59100
          59200
          43211
        ];

        allowedUDPPorts = [
          59100
          59200
          43211
          # config.services.tailscale.port
        ];
        systemd.services.NetworkManager-wait-online.enable = false;
      };
    };
  };
}
