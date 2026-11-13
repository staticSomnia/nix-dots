{ inputs, ... }: {
  flake.modules.nixos.packages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      inputs.nix-waywallen.packages.${pkgs.stdenv.hostPlatform.system}.waywallen
      inputs.nix-waywallen.packages.${pkgs.stdenv.hostPlatform.system}.waywallen-kde
      piper
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
      p7zip
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
      bubblewrap
      mpvpaper
      playerctl
      winetricks
      wineWow64Packages.stable
      javaPackages.compiler.temurin-bin.jdk-25
      python314Packages.huggingface-hub
      python314Packages.hf-transfer
      # (pkgs.llama-cpp.override {
      #   cudaSupport = true;
      #   rocmSupport = false;
      #   vulkanSupport = false;
      #   metalSupport = false;
      #   openclSupport = false;
      #   inherit (pkgs) cudaPackages;
      # })
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
          pkgs.libGL
          pkgs.SDL2
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
