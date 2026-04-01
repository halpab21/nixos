{ config, pkgs, ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
    };
  };

  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  
  services.xserver.xkb = {
    layout = "at";
    variant = "nodeadkeys";
  };

  networking.networkmanager.enable = true;

  services.flatpak.enable = true;

}
