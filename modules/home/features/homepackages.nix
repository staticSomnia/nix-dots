{ moduleWithSystem, inputs, ... }: {
  flake.modules.homeManager.homepackages = moduleWithSystem (
    { inputs', ... }:
    { pkgs, config, ... }: {

      imports = [
        inputs.rosemary.homeManagerModules.default
      ];

      home = {
        packages = with pkgs; [
          qdirstat
          ffmpeg
          # gale
          faugus-launcher
          sm64coopdx
          goverlay
          gimp
          video-trimmer
          constrict
          heroic
          easyeffects
          scrcpy
          protonplus
          qbittorrent
          cava
          fast
          tmux
          yazi
          yaziPlugins.git
          itch
          pcsx2
          rpcs3
          shadps4
          shadps4-qtlauncher
          inputs'.egs-flake.packages.default
          inputs'.quadra-rewrite.packages.quadra-rewrite
          inputs'.audiorelay.packages.audio-relay
          inputs'.freesmlauncher.packages.freesmlauncher
          inputs'.seanime-denshi.packages.seanime-denshi
          inputs'.butter.packages.default
          config.programs.rosemary.package
        ];
      };

      programs = {
        eza = {
          enable = true;
          icons = "always";
          colors = "always";
        };

        obs-studio = {
          enable = true;
        };

        yt-dlp.enable = true;

        mangohud.enable = true;

        rosemary.steam.enable = true;

        firefox.enable = true;

        lazygit = {
          enable = true;
          enableFishIntegration = true;
        };

        starship = {
          enable = true;
          enableFishIntegration = true;
          settings = {
            add_newline = true;
            command_timeout = 1300;
            scan_timeout = 50;
          };
        };

        zellij = {
          enable = true;
        };

        helix = {
          enable = true;
          # settings = {
          #   theme = "gruvbox";
          # };

          extraPackages = with pkgs; [
            nixd
            ty
            rust-analyzer
          ];
        };

        ghostty.enable = true;

        kitty = {
          enable = true;
          settings = {
            font_family = "family='JetBrainsMono Nerd Font Mono' postscript_name=JetBrainsMonoNFM-Regular";
            shell = "/run/current-system/sw/bin/fish";

            background_opacity = "0.5";
            background_blur = 1;
            hide_window_decorations = "no";
            linux_display_server = "wayland";
            resize_debounce_time = "0.1";
            sync_to_monitor = true;

            cursor_shape = "beam";
            cursor_blink_interval = "0.5";
            cursor_trail = 1;
            cursor_trail_decay = "0.1 0.4";

            scrollback_lines = 200000;
            scrollbar = "scrolled-and-hovered";

            copy_on_select = true;
            mouse_hide_while_typing = true;

            enable_audio_bell = false;
            window_alert_on_bell = false;
            confirm_os_window_close = 0;

            tab_bar_style = "powerline";
            tab_bar_min_tabs = 1;
          };
        };
      };
    }
  );
}
