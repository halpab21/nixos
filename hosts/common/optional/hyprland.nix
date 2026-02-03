{ config, pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = [
    pkgs.hyprlauncher
    pkgs.hyprshutdown
  ];
}
