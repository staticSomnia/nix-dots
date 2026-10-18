{ inputs, ... }: {
  flake.modules.nixos.niri = { config, pkgs, ... }: {
    imports = [
      # inputs.inir-nixos.nixosModules.default
      inputs.noctalia.nixosModules.default
    ];
    
    services.displayManager.gdm.enable = true;

    programs = {
      niri.enable = true;

      kdeconnect.enable = true;

      noctalia = {
        enable = true;

        # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
        recommendedServices.enable = true;
      };
    };
  };
}
