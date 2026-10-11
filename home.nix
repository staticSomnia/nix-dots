{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./modules/nixcord.nix
    ./modules/spicetify.nix
    # ./modules/stylix.nix
    # ./modules/lazyvim.nix
    ./modules/nvf.nix
    # inputs.lazyvim.homeManagerModules.default
  ];

  home = {
    username = "somnia";
    homeDirectory = "/home/somnia";
    stateVersion = "26.05";

    packages = with pkgs; [
      neovim
      gimp
      video-trimmer
      constrict
      heroic
      pywalfox-native
      easyeffects
      scrcpy
      protonplus
      qbittorrent
      pywal16
      seanime
      cava
      fast
      inputs.audiorelay.packages.x86_64-linux.audio-relay
      inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
      inputs.seanime-denshi.packages.${pkgs.stdenv.hostPlatform.system}.seanime-denshi
    ];

    file.".config/kitty".source = ./dots/kitty;
  };

  programs = {
    firefox.enable = true;

    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        add_newline = true;
        command_timeout = 1300;
        scan_timeout = 50;
      };
    };

    zellij = {
      enable = true;
    };

    helix = {
      enable = true;
      settings = {
        theme = "gruvbox";
      };

      extraPackages = with pkgs; [
        nixd
        ty
        rust-analyzer
      ];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
