{ config, pkgs, inputs, ... }: {

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
    ];



    services = {
      desktopManager.plasma6.enable = true;
      desktopManager.plasma6.enableQt5Integration = true;
      # displayManager.sddm.enable = true;
      displayManager.plasma-login-manager.enable = true;
      # xserver.enable = true;
    };

    programs.kdeconnect.enable = true;

    environment.systemPackages = with pkgs; [
      kdePackages.plasma-browser-integration
	    kdePackages.filelight
      kdePackages.sierra-breeze-enhanced
      kdePackages.qtstyleplugin-kvantum
      kde-rounded-corners
      darkly
      inputs.kwin-effects-better-blur-dx.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
