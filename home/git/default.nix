{ config, pkgs, ... }:

let
  gitConfig = {
    core = {
      editor = "nvim";
      # pager  = "diff-so-fancy | less --tabs=4 -RFX";
    };
    init.defaultBranch = "main";
  };
in
{
  programs.git = {
    enable = true;
    aliases = {
      st = "status";
      co = "checkout";
      A = "add .";
      pb = "!f() { git push -u origin $(git rev-parse --abbrev-ref HEAD); }; f";
      prb = "pull -r";
      prbm = "pull --rebase origin main";
      prbms = "pull --rebase origin master";
      l    = "log --graph --abbrev-commit --date=relative";
      please = "push --force-with-lease";
    };
    extraConfig = gitConfig;
    userEmail = "renan.piresvz@gmail.com";
    userName = "Renan Vaz";
  };
}
