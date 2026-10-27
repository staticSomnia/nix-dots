# { self, inputs, ... }: {
#   flake.nixosConfigurations.eunoia = inputs.nixpkgs.lib.nixosSystem {
#     modules = [
#       self.nixosModules.eunoiaHardware
#       self.nixosModules.eunoiaImports
#     ];
#   };
# }
