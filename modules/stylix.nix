{ pkgs, config, inputs, ... }:

{
  stylix.image = "${inputs.wallpapers}/rei3.png";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";

    targets.fish.colors.enable = true;
    targets.kitty.colors.enable = true;
    targets.cava.colors.enable = true;
    targets.btop.colors.enable = true;
    targets.starship.colors.enable = true;

    targets.spicetify.enable = false;
    targets.gnome.enable = false;
    targets.kde.enable = false;
  };
}
