{ config, pkgs, ... }:
{

  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 5;
      active_opacity = 0.95;
      inactive_opacity = 0.9;
    };
  };

}
