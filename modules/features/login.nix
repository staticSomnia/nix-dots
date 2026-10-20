{
  flake.modules.nixos.login = {
    services.displayManager.plasma-login-manager.enable = true;
    # services.displayManager.sddm.enable = true;
    # services.displayManager.sddm.wayland.enable = true;
  };
}
