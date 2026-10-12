# NixOS manual accessible by running ‘nixos-help’.
{
  self,
  ...
}:
{
  flake.nixosModules.reverieConfig = { pkgs, ... }: {

    imports = [
      self.nixosModules.reverieHardware
      self.modules.nixos.nvidia
      self.modules.nixos.kde
      # self.modules.nixos.gnome
      # self.modules.nixos.niri
      self.modules.nixos.packages
      self.modules.nixos.services
      self.modules.nixos.audio
      self.modules.nixos.networking
      self.modules.nixos.steam
      self.modules.nixos.plymouth
    ];

    # environment.sessionVariables.NIXOS_OZONE_WL = "1";
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

    virtualisation.virtualbox.host.enable = true;

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        systemd-boot.configurationLimit = 5;
      };
    };

    documentation.enable = false;
    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "26.05"; # << DO NOT CHANGE THIS LINE!!!
  };
}
