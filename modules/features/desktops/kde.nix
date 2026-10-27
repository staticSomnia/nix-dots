{ inputs, ... }: {
  flake.modules.nixos.kde = { pkgs, ... }: {

    services = {
      desktopManager.plasma6.enable = true;
      desktopManager.plasma6.enableQt5Integration = true;
      # xserver.enable = true;
    };

    programs.kdeconnect.enable = true;
    programs.kde-pim.enable = false;

    environment.systemPackages = with pkgs; [
      kdePackages.krdp
      kdePackages.krdc
      kdePackages.plasma-browser-integration
      kdePackages.filelight
      kdePackages.sierra-breeze-enhanced
      kdePackages.qtstyleplugin-kvantum
      kde-rounded-corners
      darkly
      inputs.breeze-enhanced.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.kwin-effects-better-blur-dx.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
