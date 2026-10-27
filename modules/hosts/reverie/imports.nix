{ self, ... }: {
  flake.nixosModules.reverieImports = {
    networking.hostName = "reverie";
    imports = with self.modules.nixos; [
      common
      login
      nvidia
      packages
      services
      audio
      networking
      steam
      plymouth

      # Desktops

      kde
      # gnome
      # niri
      # hyprland
      # umbriel

      # other
    ];
  };
}
