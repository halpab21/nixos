{ config, pkgs, ...  }:
let
  accent = config.colorScheme.colors.base0D;
  inactive = config.colorScheme.colors.base01;
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      border_size = 2;
      gaps_in = 2;
      gaps_out = 5;
      layout = "dwindle";
      "col.active_border" = "rgb(${accent}) rgb(${accent}) 45deg";
      "col.inactive_border" = "rgb(${inactive}) rgb(${inactive}) 45deg";
    };
  };



}
