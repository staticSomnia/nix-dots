{ config, pkgs, ... }: {


    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      konsole
      elisa
    ];



    services = {
      desktopManager.plasma6.enable = true;
      desktopManager.plasma6.enableQt5Integration = true;
      displayManager.sddm.enable = true;
      # displayManager.plasma-login-manager.enable = true;
      # xserver.enable = true;
    };

    programs.kdeconnect.enable = true;

    environment.systemPackages = with pkgs.kdePackages; [
      plasma-browser-integration
	    filelight
      sierra-breeze-enhanced
      qtstyleplugin-kvantum
    ];
}
