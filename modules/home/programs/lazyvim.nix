{ inputs, ... }: {
  flake.modules.homeManager.lazyvim =
    { pkgs, ... }:
    {
      imports = [ inputs.lazyvim.homeManagerModules.default ];

      programs.lazyvim = {
        enable = true;

        extras = {
          lang = {
            nix.enable = true;
            rust.enable = true;
            python = {
              enable = true;
              installDependencies = true;
              installRuntimeDependencies = true;
            };
          };

          ai.copilot.enable = true;

          editor.telescope.enable = true;
        };

        extraPackages = with pkgs; [
          # LSP servers
          nixd
          pyright
          copilot-language-server

          # Formatters
          black
          nixfmt
          stylua

          # Tools
          ripgrep
          fd
          statix
          vimPlugins.toggleterm-nvim
        ];

        treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
          nix
          python
          rust
        ];
        config = {
          options = ''
            vim.lsp.enable("nixd")
            vim.lsp.inline_completion.enable()
            vim.g.autoformat = false

            vim.api.nvim_set_hl(0, "Normal", { bg = "#282828" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "#282828" })
          '';

          keymaps = ''
            vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
            vim.keymap.set("t", "<C-t>", [[<C-\><C-n><cmd>ToggleTerm<cr>]], { desc = "Toggle terminal" })
          '';
        };

        plugins.toggleterm = ''
          return {
            "akinsho/toggleterm.nvim",
            dir = "${pkgs.vimPlugins.toggleterm-nvim}",
            config = true,
          }
        '';

        plugins = {
          gruvbox = ''
            return {
              "ellisonleao/gruvbox.nvim",
              priority = 1000,
              config = function()
                vim.o.background = "dark"
                vim.cmd.colorscheme("gruvbox")
              end,
            }
          '';

          cord = ''
            return {
              'vyfor/cord.nvim',
              dir = "${pkgs.vimPlugins.cord-nvim}",
              opts = {
                buttons = {
                  {
                    label = function(opts)
                      return opts.repo_url and 'View Repository' or 'Website'
                    end,
                    url = function(opts)
                      return opts.repo_url or 'https://example.com'
                    end,
                  },
                },
              },
            }
          '';
        };
      };
    };
}
