{ config, pkgs, lib, inputs, ... }: {

  boot = {
    plymouth = {
      enable = true;
      # themePackages = [ inputs.mikuboot.packages.${pkgs.system}.mikuboot];
      theme = "bgrt";
    };
    initrd.systemd.enable = true;
    initrd.verbose = false;
    kernelParams = lib.mkBefore [
      "fbcon=nodefer" # Wipes the vendor logo earlier
      "vt.global_cursor_default=0" # Stops cursor blinking while booting
      "quiet" # Less log messages
      "systemd.show_status=auto" # Only show systemd errors
      "udev.log_level=3" # Only show udev errors
      "plymouth.use-simpledrm" # Faster plymouth splash
      "splash" # Show splash
    ];
    consoleLogLevel = 3;
    loader.timeout = 0;
  };
}
