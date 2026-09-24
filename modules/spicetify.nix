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
      beautifulLyrics 
    ];

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      newReleases

      ({
          src = pkgs.fetchFromGitHub {
            owner = "ivLis-Studio";
            repo = "ivLyrics";
            rev = "c3f6e62864f1465c38726b1eb2ff13d6b3a5407f";
            hash = "sha256-e51dw0utYGbBxZEe6jEFzSftHHD5+IjLBIHt/knxOB0=";
          };
          name = "ivLyrics";
      })
    ];

    # theme = spicePkgs.themes.defaultDynamic; 
    theme = {
      name = "Liquify";

      src = pkgs.fetchFromGitHub {
        owner = "NMWplays";
        repo = "Liquify";
        rev = "9f07075b6468da525c3fe4ec14c1661a10510eff";
        hash = "sha256-GCkAfhLF/CEJ5MURnoIzifOnXrFK1l9ZVOKOgGaJNWA=";
      };

      injectCss = true;
      injectThemeJs = true;
      replaceColors = true;
      homeConfig = true;
      overwriteAssets = true;
    };
  };
}
