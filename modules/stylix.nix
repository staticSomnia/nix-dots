{
  pkgs,
  ...
}:

{
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";

    targets = {
      fish.colors.enable = true;
      kitty.colors.enable = true;
      cava.colors.enable = true;
      btop.colors.enable = true;
      starship.colors.enable = true;
      # discord.colors.enable = true;
      helix.colors.enable = true;
      zellij.colors.enable = true;
      obsidian.colors.enable = true;


      noctalia.enable = true;
      nixos-icons.enable = true;
      nvf.enable = true;

      
      # exclude
      spicetify.enable = false;
      gnome.enable = false;
      kde.enable = false;
    };
  };
}
