{ config, pkgs, ... }:
{
  services.ollama = {
    enable = true;
    host = "127.0.0.1";
    port = 11434;
  };

  environment.systemPackages = with pkgs; [
    hyprpicker
    hyprlock
    rofi-wayland
    alacritty
    jq
    curl
  ];

  hardware.graphics.enable = true;
}
