{ config, pkgs, inputs, ... }: {

  imports = [
      inputs.spicetify-nix.nixosModules.default
  ];

  programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ];
  };


}
