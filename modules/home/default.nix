{ inputs, ... }: {
  flake.modules.homeManager.somniaHome = {
    imports = with inputs.self.modules.homeManager; [
      homepackages
      nixcord
      spicetify
      stylix
      lazyvim
      # nvf
    ];

    home = {
      username = "somnia";
      homeDirectory = "/home/somnia";
      stateVersion = "26.05";
      sessionVariables.EDITOR = "nvim";
    };

    services.linux-wallpaperengine.enable = true;
    services.mpd-mpris.enable = true;

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
