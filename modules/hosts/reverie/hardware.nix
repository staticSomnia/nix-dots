{
  flake.nixosModules.reverieHardware =
    {
      config,
      lib,
      pkgs,
      modulesPath,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        loader = {
          systemd-boot = {
            enable = true;
            consoleMode = "keep";
            configurationLimit = 5;
          };

          efi.canTouchEfiVariables = true;
        };
        initrd.availableKernelModules = [
          "nvme"
          "xhci_pci"
          "ahci"
          "usbhid"
          "usb_storage"
          "sd_mod"
        ];
        # initrd.kernelModules = [
        #   "nvidia"
        #   "nvidia_modeset"
        #   "nvidia_drm"
        # ];
        kernelModules = [
          "i2c-dev"
          "i2c-piix4"
        ];
        extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
        supportedFilesystems = [ "ntfs" ];
        kernelParams = [
          "video=DP-3:2560x1440@180"
          "nvidia-drm.modeset=1"
          "nvidia-drm.fbdev=1"
          "acpi_enforce_resources=lax"
          "pci=assign-busses"
          "zswap.enabled=1"
          "zswap.max_pool_percent=50"
          "zswap.shrinker_enabled=1"
          "zswap.compressor=zstd"
          "zswap.accept_threshold_percent=90"
        ];
      };

      fileSystems = {
        "/" = {
          device = "/dev/disk/by-uuid/a0985add-f02e-40c4-8823-000e95210414";
          fsType = "ext4";
          options = [ "noatime" ];
        };
        "/boot" = {
          device = "/dev/disk/by-uuid/0459-BB7B";
          fsType = "vfat";
          options = [
            "fmask=0077"
            "dmask=0077"
          ];
        };
        "/mnt/ssd" = {
          device = "/dev/disk/by-uuid/b7443e0f-4a6a-4ef5-8e6a-86adc02fa1c4";
          fsType = "btrfs";
          options = [
            "users"
            "nofail"
            "exec"
            "noatime"
          ];
        };
        "/mnt/hdd" = {
          device = "/dev/disk/by-uuid/9e344092-731d-4e3c-b9fe-db6c3c194591";
          fsType = "ext4";
          options = [
            "rw"
            "users"
            "nofail"
            "exec"
            "noatime"
          ];
        };
      };

      swapDevices = [
        { device = "/dev/disk/by-uuid/dce48e6e-342d-4ea5-937a-7c2d3b004798"; }
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware = {
        firmware = [ pkgs.linux-firmware ];
        i2c.enable = true;
        enableRedistributableFirmware = true;
        cpu.amd.updateMicrocode = true;
      };
    };
}
