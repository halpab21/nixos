{ inputs, config, pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    pkgs.hyprlauncher
    pkgs.hyprcursor
    pkgs.hyprshutdown
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
  ];
}
