{ inputs, ... }: {
  flake.modules.nixos.common = { pkgs, ... }: {

    imports = [
      inputs.laminix.nixosModules.default
    ];

    environment.laminix.enable = true;

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
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      settings.auto-optimise-store = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
      };
    };

    nixpkgs.config.allowUnfree = true;

    documentation.enable = false;

    system.stateVersion = "26.05";
  };
}
