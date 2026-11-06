{ inputs, ... }: {
  flake.modules.nixos.common = { pkgs, ... }: {

    imports = [
      inputs.laminix.nixosModules.default
    ];

    environment.laminix.enable = true;

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      FLAKE = "/home/somnia/nix";
      NH_FLAKE = "/home/somnia/nix";
      NH_HOME_FLAKE = "/home/somnia/nix";
    };

    services.udev.packages = [
      (pkgs.writeTextDir "lib/udev/rules.d/70-linksy-usb.rules" ''
        ACTION=="remove", GOTO="linksy_usb_end"
        SUBSYSTEM!="usb", GOTO="linksy_usb_end"
        ENV{DEVTYPE}!="usb_device", GOTO="linksy_usb_end"
        ATTR{idVendor}=="18d1", ATTR{idProduct}=="2d0[0-5]", TAG+="uaccess", GOTO="linksy_usb_end"
        IMPORT{builtin}="usb_id"
        ENV{ID_USB_INTERFACES}=="*:060101:*", TAG+="uaccess"
        ENV{ID_USB_INTERFACES}=="*:ff4201:*", TAG+="uaccess"
        LABEL="linksy_usb_end"
      '')
    ];

    time.timeZone = "Asia/Riyadh";

    i18n.defaultLocale = "en_US.UTF-8";

    services.xserver.xkb = {
      layout = "us,ara";
      options = "caps:escape";
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
        auto-optimise-store = true;
      };

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
