# NixOS manual accessible by running ‘nixos-help’.

{ config, pkgs, inputs, ... }: {

	  imports =
	    [
        # system stuff

	      ./hardware-configuration.nix
        ./modules/nvidia.nix
        ./modules/kde.nix
        # ./modules/niri.nix
        inputs.ucodenix.nixosModules.default


        # user stuff

        ./modules/steam.nix
	    ];


	  environment.systemPackages = with pkgs; [
      nurl
      inputs.breeze-enhanced.packages.${pkgs.system}.default
      equibop
      equicord
      pywal16
      python314Packages.kde-material-you-colors
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
      neovim
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

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
    programs.appimage.package = pkgs.appimage-run.override 
    {
      extraPkgs = pkgs:
      [
        pkgs.icu
        pkgs.libxcrypt-legacy
        # pkgs.python312
        # pkgs.python312Packages.torch
      ];
    };

    services.ucodenix.enable = true;
    services.ucodenix.cpuModelId = "00870F10";

    # Enable pipewire.
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      # jack.enable = true;
    };

    services.cloudflare-warp = {
      enable = true;
    };

	  networking.hostName = "nixos";
	  networking.networkmanager.enable = true;
    networking.networkmanager.dns = "none";
    networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];

    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;

	  time.timeZone = "Asia/Riyadh";

	  i18n.defaultLocale = "en_US.UTF-8";

	  services.xserver.xkb = {
	    layout = "us,ara";
	    variant = "";
	  };

	  users.users."somnia" = {
	    isNormalUser = true;
	    description = "staticSomnia";
	    extraGroups = [ "networkmanager" "wheel" "gamemode" ];
      shell = pkgs.fish;
	    packages = with pkgs; [];
	  };

    programs.gpu-screen-recorder = {
      # package = inputs.gsr-ui-nix.packages.${pkgs.stdenv.hostPlatform.system}.gpu-screen-recorder;
      enable = true;
      ui.enable = true;
    };

    programs.fish.enable = true;

    programs.coolercontrol.enable = true;

	  programs.firefox.enable = true;

    services.flatpak.enable = true;

    programs.nix-ld.enable = true;

    nix.settings.trusted-users = [ "root" "somnia" ];

	  nix.settings.experimental-features = [ "nix-command" "flakes" ];

	  # services.openssh.enable = true;

	  networking.firewall.allowedTCPPorts = [ 59100 59200 ];
	  networking.firewall.allowedUDPPorts = [ 59100 59200 ];
	  # networking.firewall.enable = false;

    nixpkgs.config.allowUnfree = true;


    boot.kernelPackages = pkgs.linuxPackages_latest;

	  boot.loader.systemd-boot.enable = true;
	  boot.loader.efi.canTouchEfiVariables = true;

    boot = {
      plymouth = {
        enable = true;
      };

      # Enable "Silent boot"
      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "rd.udev.log_level=3"
        "rd.systemd.show_status=auto"
      ];

      loader.timeout = 0;
    };

	  system.stateVersion = "26.05"; # << DO NOT CHANGE THIS LINE!!!
}
