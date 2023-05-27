{ config, lib, pkgs, ... }:

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
      rose-pine
    ];
    extraPackages = with pkgs; [
      tree-sitter
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
