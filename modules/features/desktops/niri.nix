{ self, inputs, ... }: {

  perSystem = { pkgs, lib, ... }: {

    packages.myNiri = inputs.wrappers.wrappers.niri.wrap {
      settings = {
        layout.gaps = 5;

        binds = {
          "Mod+Semicolon".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = null;
        };
      };
    };

  };
}

