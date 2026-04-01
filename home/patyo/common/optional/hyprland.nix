{ config, pkgs, ... }:
{
  imports = [
    ./hyprland
  ];

  wayland.windowManager.hyprland.enable = true;

  programs.kitty.enable = true;

  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "de";
    };
  };
}
