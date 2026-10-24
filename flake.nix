{

  description = "Somnia's NixOS configuration";

  inputs = {

    #IMPORTANT
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    audiorelay.url = "github:70705/audiorelay-flake";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nixcord.url = "github:4evy/nixcord";

    freesmlauncher = {
      url = "github:FreesmTeam/FreesmLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kwin-effects-better-blur-dx = {
      url = "github:xarblu/kwin-effects-better-blur-dx";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    breeze-enhanced.url = "path:/home/somnia/git/BreezeEnhanced";

    seanime-denshi = {
      url = "path:/home/somnia/git/seanime-denshi.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # mikuboot.url = "gitlab:evysgarden/mikuboot";

    lazyvim.url = "github:pfassina/lazyvim-nix";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia.url = "github:noctalia-dev/noctalia/cachix";

    rosemary.url = "github:microlift/rosemary";

    butter.url = "github:microlift/butter";

    inir.url = "github:Kexfff/iNiR-flake";

    umbriel.url = "github:noctalia-dev/umbriel/cachix";

    odysseus-nix = {
      url = "github:KangaZero/odysseus-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
