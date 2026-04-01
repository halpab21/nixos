{ inputs, config, pkgs, ... }:
{

  wayland.windowManager.hyprland.settings = {

    monitor = [
      "DP-4,1920x1080@144,0x0,1"
      "DP-3,1920x1080@60,1920x0,1"
      "eDP-1,1920x1080@60,3840x0,1"
    ];

  };

}
