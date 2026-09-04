{ config, pkgs, inputs, ... }: {


    programs.niri.enable = true;
    programs.noctalia.enable = true;
    programs.noctalia.systemd.enable = true;
    programs.noctalia.recommendedServices.enable = true;

    # services.greetd = {
    #   enable = true;
    #   settings = {
    #     default_session = {
    #       command = "${config.programs.niri.package}/bin/niri-session";
    #       user = "somnia";
    #     };
    #   };
    # };


    environment.systemPackages = with pkgs; [
      nautilus
      xdg-desktop-portal-gnome
      ghostty
      alacritty
      swaylock
      brightnessctl

      # Wayland clipboard & typing
      wl-clipboard
      cliphist
      wtype

      # App launcher, display config
      fuzzel
      libnotify
      wdisplays # drag-and-drop output arrangement; launched from noctalia display-config plugin for 3+ monitor setups
      wl-mirror # screen mirroring (wl-mirror + wl-present); driven by noctalia display-config plugin and kanshi mirror profiles

      # Audio
      pavucontrol

      # Desktop shell: installed via Home Manager (programs.noctalia)
      # Qt's wayland QPA leaves QIcon::themeName empty so noctalia falls through
      # to hicolor and can't find generic icons like user-desktop. The gtk3
      # platform theme reads gtk-icon-theme-name; ship breeze so that resolves.
      kdePackages.breeze-icons

      # Needed by noctalia kde-connect plugin's "Browse files" (SFTP mount)
      sshfs

      # File manager — terminal-based, themed via noctalia's yazi template
      # (wallpaper-derived colors). GUI file manager dropped; xdg-open on
      # directories falls back to yazi via its .desktop file.
      yazi

      # KDE Wallet (secret service provider + management UI)
      kdePackages.kwallet
      kdePackages.kwalletmanager

      # Screenshot tools
      grim
      slurp
    ];
}
