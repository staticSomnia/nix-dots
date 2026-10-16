{ moduleWithSystem, ... }: {
  flake.modules.homeManager.homepackages = moduleWithSystem (
    { inputs', ... }:
    { pkgs, ... }: {
      home = {
        packages = with pkgs; [
          ghostty
          gimp
          video-trimmer
          constrict
          heroic
          pywalfox-native
          easyeffects
          scrcpy
          protonplus
          qbittorrent
          pywal16
          seanime
          cava
          fast
          inputs'.audiorelay.packages.audio-relay
          inputs'.freesmlauncher.packages.freesmlauncher
          inputs'.seanime-denshi.packages.seanime-denshi
        ];
      };

      programs = {
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
          settings = {
            theme = "gruvbox";
          };

          extraPackages = with pkgs; [
            nixd
            ty
            rust-analyzer
          ];
        };

        kitty = {
          enable = true;
          settings = {
            font_family = "family='JetBrainsMono Nerd Font Mono' postscript_name=JetBrainsMonoNFM-Regular";
            shell = "/run/current-system/sw/bin/fish";

            background_opacity = "0.1";
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
