{ config, pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = [
    pkgs.kitty
    pkgs.hyprshutdown
  ];
}
