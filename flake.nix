{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nixcord.url = "github:4evy/nixcord";

    ucodenix.url = "github:e-tho/ucodenix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        # ...
      ];
    };

    homeConfigurations = {
        somnia = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages."x86_64-linux";
            modules = [ ./home.nix ];
          };
      };

  };
}

