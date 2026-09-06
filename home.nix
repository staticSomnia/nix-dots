{ inputs, config, pkgs, ... }:

{
  imports = [
    # inputs.nixcord.homeModules.nixcord
    ./modules/nixcord.nix
    ./modules/spicetify.nix
  ];

  # programs.nixcord = {
  #   enable = true;
  #
  #   # Explicitly enable Vencord for Discord.
  #   discord.vencord.enable = true;
  #
  #   config.plugins = {
  #     hideMedia.enable = true;
  #   };
  # };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "somnia";
  home.homeDirectory = "/home/somnia";


  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  home.packages = [
    pkgs.fast
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
    inputs.seanime-denshi.packages.${pkgs.stdenv.hostPlatform.system}.seanime-denshi
  ];

  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;

  # stylix.enable = true;
  # stylix.image = ./SnowyMountain.png;
  # stylix.targets.spicetify.colors.enable = false;

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
