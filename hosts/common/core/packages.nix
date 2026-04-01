{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [   
    vim
    sops
    age
    unzip
    unityhub
    appimage-run
  ];

}
