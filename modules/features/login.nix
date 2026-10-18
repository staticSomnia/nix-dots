{ inputs, ... }: {
  flake.modules.nixos.login = {
    imports = [ inputs.qylock.nixosModules.default ];

    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;

    programs.qylock = {
      enable = true;
      theme = "material-you-dark";          # any directory name under themes/
      # sddm.enable = true;             # installs theme + sets it active (default)
      # quickshell.enable = true;       # adds `qylock-lock` to PATH (default)

      # Optional per-theme tweaks (replaces the interactive prompts):
      themeOptions = {
        terraria.backgroundMode = "time";              # time | random | static
        Genshin.backgroundMode = "time";
        clockwork.orbital = { themeMode = "dark"; enableWindup = true; };
        osu.gameMode = "menu";                         # menu | game
      };
    };
  };
}
