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
    # ./modules/stylix.nix
  ];

  environment.systemPackages = with pkgs; [
    unzip
    powershell
    cava
    gimp
    opencode
    opencode-desktop
    ollama-vulkan
    javaPackages.compiler.temurin-bin.jdk-25
    video-trimmer
    constrict
    unrar
    rar
    android-tools
    nurl
    equibop
    equicord
    pywal16
    inputs.audiorelay.packages.x86_64-linux.audio-relay
    ddcutil
    pulseaudio
    pywalfox-native
    easyeffects
    python3
    heroic
    scrcpy
    python314Packages.syncedlyrics
    xwayland-satellite
    seanime
    qbittorrent
    harfbuzzFull
    wineWow64Packages.stable
    winetricks
    protonplus
    imagemagick
    cliphist
    wget
    git
    git-lfs
    fastfetch
    btop
    kitty
    ghostty
    tree
    feh
    mpv
    mpvpaper
    seanime
    playerctl
    bubblewrap
  ];

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

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
      libraries = with pkgs; [
        (pkgs.runCommand "steamrun-lib" { } "mkdir $out; ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib")
      ];
    };

    lazygit.enable = true;

    gpu-screen-recorder = {
      enable = true;
      ui.enable = true;
    };

    fish.enable = true;

    coolercontrol.enable = true;

    firefox.enable = true;
  };

  services = {
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
    packages = with pkgs; [ ];
  };

  nix.settings.trusted-users = [
    "root"
    "somnia"
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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
    firewall.allowedTCPPorts = [
      59100
      59200
      43211
    ];
    firewall.allowedUDPPorts = [
      59100
      59200
      43211
    ];
    # firewall.enable = false;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 5;
    };
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05"; # << DO NOT CHANGE THIS LINE!!!
}
