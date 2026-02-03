{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      l = "ls -l";
      rebuild = "sudo nixos-rebuild switch";
    };
  

    ohMyZsh = {
      enable = true;
      plugins = [
             "git"
             "dirhistory"
             "history"
      ];
      theme = "powerlevel10k/powerlevel10k";
    };
  };

}
