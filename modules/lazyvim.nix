{
  inputs,
  config,
  pkgs,
  ...
}:

{
  programs.lazyvim = {
    enable = true;

    extras = {
      lang = {
        nix.enable = true;
        rust.enable = true;
        python = {
          enable = true;
          installDependencies = true; # Install ruff
          installRuntimeDependencies = true; # Install python3
        };
      };

      ai.copilot.enable = true;

      editor.telescope.enable = true;
    };

    # Additional packages (optional)
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
  };
}
