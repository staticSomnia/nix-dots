{ inputs, ... }: {
  flake.modules.nixos.login = {
    imports = [ inputs.silentSDDM.nixosModules.default ];

    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;

    programs.silentSDDM = {
        enable = true;
        # theme = "rei";
        # settings = { ... }; see example in module
    };
  };
}
