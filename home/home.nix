{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  #
  home.username = "renan";
  home.homeDirectory = "/home/renan";

  home.packages = [
    pkgs.htop
    pkgs.alacritty
    pkgs.any-nix-shell
    pkgs.ripgrep
    pkgs.zoom-us
  ];

  programs.fish = {
    enable = true;
    shellAliases = {
      g = "g";
      glog = "git log --oneline --graph";
      ll = "ls -l";
      update = "home-manager switch -f ~/.dotfiles/home/home.nix";
      update-system = "sudo nixos-rebuild switch -I nixos-config=~/.dotfiles/configuration.nix";
    };
    shellInit = ''
        fish_vi_key_bindings
      '';
    promptInit = ''
        any-nix-shell fish --info-right | source
      '';
  };

  imports = [
    ./neovim
    ./rofi 
    ./git 
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
}
