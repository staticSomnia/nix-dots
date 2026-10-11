# NixOS manual accessible by running ‘nixos-help’.
{
  config,
  pkgs,
  inputs,
  ...
}:
{

  imports = [
    # system stuff

    ./hardware-configuration.nix
    ./modules/nvidia.nix
    ./modules/kde.nix
    # ./modules/gnome.nix
    # ./modules/niri.nix
    inputs.ucodenix.nixosModules.default

    # user stuff

    ./modules/steam.nix
    ./modules/plymouth.nix
  ];

  environment.systemPackages = with pkgs; [
    cachix
    nix-output-monitor
    nvd
    nh
    bat
    gcc
    rustup
    unzip
    powershell
    unrar
    rar
    android-tools
    nurl
    ddcutil
    pulseaudio
    python3
    xwayland-satellite
    harfbuzzFull
    imagemagick
    cliphist
    wget
    git
    git-lfs
    fastfetch
    btop
    tree
    feh
    mpv
    mpvpaper
    playerctl
    mpd
    mpd-mpris
    bubblewrap
    winetricks
    wineWow64Packages.stable
    javaPackages.compiler.temurin-bin.jdk-25
  ];

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables = {
    FLAKE = "/home/somnia/nix";
    NH_FLAKE = "/home/somnia/nix";
    NH_HOME_FLAKE = "/home/somnia/nix";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs = {
    appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs = pkgs: [
          pkgs.icu
          pkgs.libxcrypt-legacy
          pkgs.libva
          pkgs.libdrm
          # pkgs.python312
          # pkgs.python312Packages.torch
        ];
      };
    };

    nix-ld = {
      enable = true;
      libraries = [
        (pkgs.runCommand "steamrun-lib" { } "mkdir $out; ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib")
      ];
    };

    gpu-screen-recorder = {
      enable = true;
      ui.enable = true;
    };

    fish.enable = true;

    coolercontrol.enable = true;

  };

  services = {

    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };

    hardware.openrgb = {
      enable = true;
      package = pkgs.openrgb-with-all-plugins;
      motherboard = "amd";
      server.port = 6742;
    };

    flatpak.enable = true;

    ucodenix.enable = true;
    ucodenix.cpuModelId = "00870F10";

    cloudflare-warp = {
      enable = true;
    };

    power-profiles-daemon.enable = true;
    upower.enable = true;

    # openssh.enable = true;

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      # jack.enable = true;
      extraConfig.pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 32;
          "default.clock.min-quantum" = 32;
          "default.clock.max-quantum" = 1024;
        };
      };
    };
  };

  security.rtkit.enable = true;

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
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  networking = {
    networkmanager.enable = true;
    # wireless.iwd.enable = true;
    # networkmanager.wifi.backend = "iwd";
    # wireless.iwd.settings.Settings.AutoConnect = true;
    # dhcpcd.enable = true;
    networkmanager.dns = "none";
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    hostName = "nixos";
    firewall = { 
      trustedInterfaces = [
        config.services.tailscale.interfaceName
      ];

      allowedTCPPorts = [
        59100
        59200
        43211
      ];

      allowedUDPPorts = [
        59100
        59200
        43211
        config.services.tailscale.port
      ];
    };
  };

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
}
