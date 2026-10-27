{
  flake.modules.nixos.login = {
    # services.displayManager.sddm.enable = true;
    # services.displayManager.sddm.wayland.enable = true;

    # services.displayManager.gdm.enable = true;

    services.displayManager.plasma-login-manager.enable = true;

    # services.displayManager.noctalia-greeter.enable = true;
  };
}
