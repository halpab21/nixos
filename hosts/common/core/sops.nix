{ inputs, config, pkgs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops.defaultSopsFile = ./secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  
  sops.age.keyFile = "/etc/sops/age/keys.txt";
  
  sops.secrets."school_wifi/patyo/identity" = {};
  sops.secrets."school_wifi/patyo/password" = {};

}
