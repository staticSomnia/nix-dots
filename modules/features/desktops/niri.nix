{ inputs, ... }: {
  flake.modules.nixos.niri = { pkgs, ... }: {
    imports = [
      inputs.inir.nixosModules.default
      # inputs.noctalia.nixosModules.default
    ];

    services.displayManager.gdm.enable = true;

    programs = {
      niri.enable = true;

      kdeconnect.enable = true;

      inir = {
        enable = true;
        users = [ "somnia" ];

        # Extra CLI / TUI tools to make available inside inir's environment:
        extraPackages = with pkgs; [
          whisper-cpp # Local speech-to-text
          cloudflare-warp # Cloudflare WARP quick toggle
        ];
      };

      # noctalia = {
      #   enable = true;
      #
      #   # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
      #   recommendedServices.enable = true;
      # };
    };
  };
}
