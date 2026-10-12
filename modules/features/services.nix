{ pkgs, ... }: {
  flake.modules.nixos.services = _: {
    services = {

      # openssh.enable = true;

      tailscale = {
        enable = true;
        useRoutingFeatures = "both";
      };

      hardware.openrgb = {
        enable = true;
        package = pkgs.openrgb-with-all-plugins;
        motherboard = "amd";
        server.port = 6742;
      };

      flatpak.enable = true;

      cloudflare-warp = {
        enable = true;
      };

      power-profiles-daemon.enable = true;
      upower.enable = true;
    };
  };
}
