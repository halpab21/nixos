{ config, pkgs, ... }:
{

  users.users.patyo = {
    isNormalUser = true;
    description = "Patrik main user";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages= with pkgs; [];
  };

}
