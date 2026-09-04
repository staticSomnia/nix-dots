{ config, pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      shuffle
    ];

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      newReleases
    ];

    theme = spicePkgs.themes.defaultDynamic; 
    # theme = {
    #   name = "Spicetify-Lucid";
    #
    #   src = pkgs.fetchFromGitHub {
    #     owner = "sanoojes";
    #     repo = "Spicetify-Lucid";
    #     rev = "05df458210c535e84c9173fe87059748229af9ad";
    #     hash = "sha256-XdgoCe9v/akh9+eCdTa2ldYG6mqnNuISGzn3c8SySbM=";
    #   };
    #
    #   injectCss = true;
    #   injectThemeJs = true;
    #   replaceColors = true;
    #   homeConfig = true;
    #   overwriteAssets = true;
    # };
  };
}
