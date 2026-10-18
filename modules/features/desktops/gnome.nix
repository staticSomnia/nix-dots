{
  flake.modules.nixos.gnome = { pkgs, ... }: {

    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      gnome.core-apps.enable = true;
      gnome.core-developer-tools.enable = true;
      gnome.games.enable = true;
    };

    # To disable installing GNOME's suite of applications
    # and only be left with GNOME shell.

    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-user-docs
    ];

    environment.systemPackages = with pkgs; [
      # Themes the app titlebars
      qadwaitadecorations
      qadwaitadecorations-qt6
      # Themes the apps
      qgnomeplatform
      qgnomeplatform-qt6

      gnome-tweaks
      gnomeExtensions.blur-my-shell
      gnomeExtensions.just-perfection
    ];

    qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita-dark";
    };
  };
}
