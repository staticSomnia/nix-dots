{ pkgs, ... }: {
  flake.modules.nixos.packages = _: {
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
  };
}
