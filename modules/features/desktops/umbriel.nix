{ inputs, ... }: {
  flake.modules.nixos.umbriel = { pkgs, ... }: {
    imports = [
      inputs.umbriel.nixosModules.default
      inputs.noctalia.nixosModules.default
    ];

    environment.systemPackages = with pkgs; [
      pcmanfm-qt
    ];

    programs = {
      umbriel.enable = true;

      noctalia = {
        enable = true;

        # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
        recommendedServices.enable = true;
      };

      kdeconnect.enable = true;
    };
  };
}
