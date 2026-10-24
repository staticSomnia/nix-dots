# NixOS manual accessible by running ‘nixos-help’.
{
  self,
  ...
}:
{
  flake.nixosModules.reverieConfig = { pkgs, ... }: {

    imports = with self.modules.nixos; [
      login
      nvidia
      packages
      services
      audio
      networking
      steam
      plymouth

      # Desktops

      kde
      # gnome
      # niri
      # hyprland
      # umbriel
    ];

    environment.sessionVariables = {
      FLAKE = "/home/somnia/nix";
      NH_FLAKE = "/home/somnia/nix";
      NH_HOME_FLAKE = "/home/somnia/nix";
    };

    time.timeZone = "Asia/Riyadh";

    i18n.defaultLocale = "en_US.UTF-8";

    services.xserver.xkb = {
      layout = "us,ara";
      variant = "";
    };

    users.users."somnia" = {
      isNormalUser = true;
      description = "staticSomnia";
      extraGroups = [
        "networkmanager"
        "wheel"
        "gamemode"
        "video"
        "i2c"
        "vboxusers"
      ];
      shell = pkgs.fish;
    };

    nix = {
      settings = {
        trusted-users = [
          "root"
          "somnia"
        ];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        max-jobs = "auto";
        cores = 0;
        http-connections = 50;
      };
    };

    # virtualisation.virtualbox.host.enable = true;

    documentation.enable = false;
    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "26.05";
  };
}
