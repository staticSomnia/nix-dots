{
  pkgs,
  ...
}:

{

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";

    autoEnable = false;
    polarity = "dark";

    targets = {
      # master
      kitty.enable = true;
      noctalia.enable = true;
      nixos-icons.enable = true;
      nvf.enable = true;


      # colors
      kitty.colors.enable = true;
      fish.colors.enable = true;
      cava.colors.enable = true;
      btop.colors.enable = true;
      starship.colors.enable = true;
      # discord.colors.enable = true;
      helix.colors.enable = true;
      zellij.colors.enable = true;
      obsidian.colors.enable = true;


      # fonts
      kitty.fonts.enable = false;
      

      # opacity
      kitty.opacity.enable = false;


      # exclude
      spicetify.enable = false;
      gnome.enable = false;
      kde.enable = false;
    };
  };
}
