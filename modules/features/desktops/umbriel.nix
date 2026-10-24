{ inputs, ... }: {
  flake.modules.nixos.umbriel = {
    imports = [
      inputs.umbriel.nixosModules.default
      inputs.noctalia.nixosModules.default
    ];

    programs = {
      umbriel.enable = true;

      noctalia = {
        enable = true;

        # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
        recommendedServices.enable = true;
      };
    };
  };
}
