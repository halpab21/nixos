{ config, pkgs, ... }:
{

  imports = [
    ./monitors.nix
    ./decoration.nix
    ./envs.nix
    ./general.nix
    ./keybinds.nix

  ];

}
