{ config, pkgs, ...  }:
{
  wayland.windowManager.hyprland.settings = {
    general = {
      border_size = 2;
      gaps_in = 2;
      gaps_out = 5;
      layout = "dwindle";
    };
  };



}
