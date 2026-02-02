{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "halpab21";
        email = "halpab21@htl-kaindorf.at";
      };
    };
  };  
}
