{ inputs, ... }: {
  flake.modules.homeManager.stylix = { pkgs, ... }: {
    imports = [ inputs.stylix.homeModules.stylix ];

    stylix = {
      enable = true;
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
      image = /home/somnia/walls/landscape1.jpg;

      autoEnable = false;
      polarity = "dark";

      targets = {

        ghostty.enable = true;

        kitty = {
          enable = true;
          fonts.enable = false;
          opacity.enable = false;
        };

        lazygit.enable = true;
        yazi.enable = true;
        fish.enable = true;
        cava.enable = true;
        starship.enable = true;
        btop.enable = true;
        helix.enable = true;
        zellij.enable = true;
        obsidian.enable = true;
        # noctalia.enable = true;
        nixos-icons.enable = true;
        nvf.enable = true;
        neovim.enable = true;
        # nixcord.enable = true;
      };
    };
  };
}
