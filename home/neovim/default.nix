{ config, lib, pkgs, ... }:

# TODO
# leader q,w,x
# multiple cursor
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      :luafile ~/.config/nvim/lua/init.lua
      colorscheme rose-pine
    '';
    plugins = with pkgs.vimPlugins; [
      vim-elixir
      vim-nix
      plenary-nvim
      telescope-nvim
      trouble-nvim
      nvim-treesitter.withAllGrammars
      # LSP
      nvim-lspconfig
      nvim-lsp-ts-utils
      fidget-nvim

      # Completions
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-nvim-lsp-signature-help
      nvim-cmp

      # Snippets
      luasnip
      cmp_luasnip

      rose-pine
   ];
    extraPackages = with pkgs; [
      tree-sitter
      # Elixir
      beam.packages.erlang.elixir-ls
      # Haskell
      haskellPackages.haskell-language-server
      # Lua
      sumneko-lua-language-server
      # Nix
      nil
      nixpkgs-fmt
      statix
      # Typescript
      nodePackages.typescript-language-server
      # Web (ESLint, HTML, CSS, JSON)
      nodePackages.vscode-langservers-extracted
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
