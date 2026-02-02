{ config, pkgs, ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
    };
  };
  
  services.xserver.xkb = {
    layout = "at";
    variant = "nodeadkeys";
  };

  networking.networkmanager.enable = true;

}
