{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./modules/nixcord.nix
    ./modules/spicetify.nix
    ./modules/lazyvim.nix
    # ./modules/stylix.nix
    inputs.lazyvim.homeManagerModules.default
  ];

  home.username = "somnia";
  home.homeDirectory = "/home/somnia";

  home.stateVersion = "26.05"; # << DO NOT CHANGE THIS LINE!!!

  home.packages = with pkgs; [
    fast
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
    inputs.seanime-denshi.packages.${pkgs.stdenv.hostPlatform.system}.seanime-denshi
  ];

  programs = {

    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        add_newline = true;
        command_timeout = 1300;
        scan_timeout = 50;
      };
    };

  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # EDITOR = "nvim";
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.file.".config/kitty".source = ./dots/kitty;

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/somnia/etc/profile.d/hm-session-vars.sh

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
