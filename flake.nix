{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nixcord.url = "github:4evy/nixcord";

    ucodenix.url = "github:e-tho/ucodenix";

    audiorelay.url = "github:70705/audiorelay-flake";

    freesmlauncher = {
        url = "github:FreesmTeam/FreesmLauncher";
        inputs.nixpkgs.follows = "nixpkgs";
      };

    kwin-effects-better-blur-dx = {
      url = "github:xarblu/kwin-effects-better-blur-dx";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # sops-nix.url = "github:Mic92/sops-nix";
    # sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    breeze-enhanced.url = "path:/home/somnia/git/BreezeEnhanced";

    # nix-waywallen.url = "github:gettbitgirl/nix-waywallen";

    seanime-denshi = {
      url = "github:LibereCode/seanime-denshi.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mikuboot.url = "gitlab:evysgarden/mikuboot";

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };

            home-manager.users.somnia = import ./home.nix;
        }

        {
          nix.settings = {
            substituters = [
              "https://cache.nixos.org"
              "https://freesmlauncher.cachix.org"
            ];

            trusted-public-keys = [
              "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
              "freesmlauncher.cachix.org-1:hX0BqSt13djXVbhagJ6toEEBA15xxZPWwKGpYksuiQ0="
            ];
          };
        }
      ];
    };
  };
}

