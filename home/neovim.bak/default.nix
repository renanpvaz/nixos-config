{ config, lib, pkgs, ... }:

let 
  myVimPlugins = with pkgs.vimPlugins; [
    coc-nvim                # LSP client + autocompletion plugin
    # pkgs.coc-nvim-fixed     # LSP client + autocompletion plugin
    # ghcid                   # ghcid for Haskell
    multiple-cursors        # Multiple cursors selection, etc
    nerdcommenter           # code commenter
    # nerdtree                # tree explorer
    # nerdtree-git-plugin     # shows files git status on the NerdTree
    # tender-vim              # a clean dark theme
    # vim-airline             # bottom status bar
    # vim-airline-themes
    # vim-css-color           # preview css colors
    # vim-fugitive            # git plugin
    vim-nix                 # nix support (highlighting, etc)
    ctrlp-vim
    tender-vim
    vim-airline
    vim-airline-themes
    awesome-vim-colorschemes
    typescript-vim
    vimwiki
    coc-rust-analyzer
  ];
  baseConfig    = builtins.readFile ./config.vim;
  cocSettings   = builtins.toJSON (import ./coc-settings.nix);
in
{
  programs.neovim = {
    enable       = true;
    plugins      = myVimPlugins;
    viAlias      = true;
    vimAlias     = true;
    vimdiffAlias = true;
    withNodeJs   = true; # for coc.nvim
    withPython3  = false;
  };

  xdg.configFile = {
    "nvim/coc-settings.json".text = cocSettings;
    "nvim/init.vim".text = baseConfig;
  };
}
