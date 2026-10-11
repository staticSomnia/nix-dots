{ self, inputs, ... }:
{
  flake.nixosConfigurations.reverie = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.reverieConfig
    ];
  };
}
