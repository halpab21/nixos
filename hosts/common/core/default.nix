{ config, pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./locale.nix
    ./nix.nix
    ./packages.nix
    ./services.nix
    ./sops.nix
    ./zsh.nix  
  ]; 


}
