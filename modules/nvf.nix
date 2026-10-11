{
  inputs,
  self,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = true;
    defaultEditor = true;

    settings = {
      vim = {
        options = {
          tabstop = 2;
          shiftwidth = 2;
          softtabstop = 2;
          expandtab = true;
        };

        viAlias = true;
        vimAlias = true;

        enableLuaLoader = true;
        hideSearchHighlight = false;
        searchCase = "smart";

        keymaps = [
          # Window navigation (LazyVim defaults)
          {
            key = "<C-h>";
            mode = "n";
            action = "<C-w>h";
            desc = "Go to Left Window";
            silent = true;
          }
          {
            key = "<C-j>";
            mode = "n";
            action = "<C-w>j";
            desc = "Go to Lower Window";
            silent = true;
          }
          {
            key = "<C-k>";
            mode = "n";
            action = "<C-w>k";
            desc = "Go to Upper Window";
            silent = true;
          }
          {
            key = "<C-l>";
            mode = "n";
            action = "<C-w>l";
            desc = "Go to Right Window";
            silent = true;
          }

          # Buffer switching
          {
            key = "<S-h>";
            mode = "n";
            action = "<cmd>bprevious<cr>";
            desc = "Prev Buffer";
            silent = true;
          }
          {
            key = "<S-l>";
            mode = "n";
            action = "<cmd>bnext<cr>";
            desc = "Next Buffer";
            silent = true;
          }

          {
            key = "<leader>e";
            mode = "n";
            action = "<cmd>NvimTreeToggle<cr>";
            desc = "Explorer";
            silent = true;
          }
          {
            key = "<leader>bd";
            mode = "n";
            action = "<cmd>bdelete<cr>";
            desc = "Delete Buffer";
            silent = true;
          }
          {
            key = "<leader>cf";
            mode = ["n" "v"];
            lua = true;
            action = "function() require('conform').format({ lsp_fallback = true }) end";
            desc = "Format";
            silent = true;
          }
        ];

        autocomplete.blink-cmp.enable = true;
        telescope.enable = true;
        statusline.lualine.enable = true;
        comments.comment-nvim.enable = true;
        git.gitsigns.enable = true;

        lsp = {
          enable = true;

          presets = {
            nixd.enable = true;
          };
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          bash.enable = true;
          clang.enable = true;
          css.enable = true;
          go.enable = true;
          html.enable = true;
          java.enable = true;
          lua.enable = true;
          python.enable = true;
          rust.enable = true;
          yaml.enable = true;

          nix = {
            enable = true;
            format = {
              enable = true;
              # type = "nixfmt";
            };
          };
        };

        theme = {
          enable = true;
          # name = "gruvbox";
          # style = "dark";
        };

        notify.nvim-notify = {
          enable = true;

          setupOpts = {
            render = "minimal";
            stages = "static";
          };
        };

        spellcheck = {
          enable = true;
          languages = [
            "en"
          ];
        };

        terminal.toggleterm = {
          enable = true;

          setupOpts = {
            direction = "float";
          };
        };

        utility = {
          preview.markdownPreview = {
            enable = true;
          };
        };

        mini = {
          icons.enable = true;

          tabline = {
            enable = true;

            setupOpts = {
              show_icons = true;
            };
          };
        };

        visuals = {
          indent-blankline.enable = true;
        };

        ui = {
          noice.enable = true;

          borders = {
            enable = true;
            globalStyle = "rounded";

            plugins.nvim-cmp.enable = false;
          };

          smartcolumn = {
            enable = true;

            setupOpts.custom_colorcolumn = {
              nix = "110";
              rust = "120";
            };
          };
        };

        filetree = {
          nvimTree.enable = true;
        };
      };
    };
  };
}
