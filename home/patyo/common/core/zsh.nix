{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    
    autosuggestion = {
      enable = true;
    };

    syntaxHighlighting = {
      enable = true;
    };

    # History settings
    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      extended = true;
      share = true;
    };

    shellAliases = {
      l = "ls -l";
      la = "ls -la";
      ll = "ls -lah";
      rebuild = "sudo nixos-rebuild switch";
      update = "sudo nixos-rebuild switch --flake .#medion";
      
      suops = "sudo SOPS_AGE_KEY_FILE=/home/patyo/.config/sops/age/keys.txt sops";
  
      # Common shortcuts
      ".." = "cd ..";
      "..." = "cd ../..";
      
      # Safety aliases
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "dirhistory"
        "history"
        "sudo"
        "copypath"
        "copyfile"
        "web-search"
        "extract"
      ];
      custom = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
      theme = "powerlevel10k";
    };
   
    # Source p10k instant prompt BEFORE oh-my-zsh loads
    initContent = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi

      # Source powerlevel10k config
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

      # Case-insensitive tab completion
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      
      # Colored completion menus
      zstyle ':completion:*' menu select
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      
      # Better directory navigation
      setopt AUTO_CD
      setopt AUTO_PUSHD
      setopt PUSHD_IGNORE_DUPS
      setopt PUSHD_SILENT
    '';
  };
}
