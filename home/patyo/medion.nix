{ config, pkgs, ... }:

{
  imports = [
    ./common/optional/hyprland.nix
    ./common/core
  ];

  home.username = "patyo";
  home.homeDirectory = "/home/patyo";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = [
    pkgs.jetbrains-toolbox
  ];

  home.file = {
  
  };
  
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;
}
