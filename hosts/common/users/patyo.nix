{ config, pkgs, ... }:
{
  programs.zsh.enable = true;

  users.users.patyo = {
    isNormalUser = true;
    description = "patyo";
    extraGroups = [ "docker" "networkmanager" "wheel" "video" ];
    packages= with pkgs; [];
    shell = pkgs.zsh;
  };

}
