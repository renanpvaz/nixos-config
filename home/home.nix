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
    pkgs.vscode
    pkgs.python2
    pkgs.gnumake
    pkgs.elmPackages.elm
    pkgs.elmPackages.elm-test
    pkgs.elmPackages.elm-format
    pkgs.elmPackages.elm-language-server
  ];

  programs.fish = {
    enable = true;
    shellAliases = {
      g = "git";
      glog = "git log --oneline --graph";
      ll = "ls";
      update = "home-manager switch -f /home/renan/.config/nixos-config/home/home.nix";
      update-system = "sudo nixos-rebuild switch -I nixos-config=/home/renan/.config/nixos-config/configuration.nix";
    };
    shellInit = ''
        fish_vi_key_bindings
      '';
    promptInit = ''
        any-nix-shell fish --info-right | source
      '';
  };

  programs.vscode = {
    enable = true;
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
