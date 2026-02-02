{ config, pkgs, ... }:
{
  imports = [
    ./hyprland/keybinds.nix
    ./hyprland/general.nix
    ./hyprland/decoration.nix
  ];

  programs.kitty.enable = true;

  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "de";
    };
  };
}
