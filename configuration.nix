# NixOS manual accessible by running ‘nixos-help’.

{ config, pkgs, inputs, ... }: {

	  imports =
	    [
        # system stuff
	      ./hardware-configuration.nix
        ./modules/nvidia.nix
        ./modules/kde.nix
        # home stuff
        ./modules/steam.nix
        ./modules/spicetify.nix
        ./modules/nixcord.nix
        inputs.ucodenix.nixosModules.default
	    ];

	  environment.systemPackages = with pkgs; [
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
	  fastfetch
	  btop
	  kitty
	  tree
	  feh
	  mpv
	  seanime
    playerctl
    bubblewrap
	  ];

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


	  nix.settings.experimental-features = [ "nix-command" "flakes" ];

	  boot.loader.systemd-boot.enable = true;
	  boot.loader.efi.canTouchEfiVariables = true;

	  networking.hostName = "nixos";

	  networking.networkmanager.enable = true;

    networking.networkmanager.dns = "none";
    networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];

	  time.timeZone = "Asia/Riyadh";

	  i18n.defaultLocale = "en_US.UTF-8";

	  services.xserver.xkb = {
	    layout = "us,ar";
	    variant = "";
	  };

	  users.users."somnia" = {
	    isNormalUser = true;
	    description = "staticSomnia";
	    extraGroups = [ "networkmanager" "wheel" "gamemode" ];
      shell = pkgs.fish;
	    packages = with pkgs; [];
	  };

    programs.fish.enable = true;

    programs.coolercontrol.enable = true;

	  programs.firefox.enable = true;

    services.flatpak.enable = true;

	  nixpkgs.config.allowUnfree = true;

	  # services.openssh.enable = true;

	  # networking.firewall.allowedTCPPorts = [ ... ];
	  # networking.firewall.allowedUDPPorts = [ ... ];
	  # networking.firewall.enable = false;

	  system.stateVersion = "26.05"; # << DO NOT CHANGE THIS LINE!!!
}
