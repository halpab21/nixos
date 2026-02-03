{ inputs, config, pkgs, ... }:

{
  imports = [
    ./common/core
    ./common/users/patyo.nix
    ../system/hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ./common/optional/hyprland.nix
    ./common/optional/school-wifi.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      patyo = import ../home/patyo/medion.nix;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
  };

  networking.hostName = "medion";

  programs.light.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

  ];

  system.stateVersion = "25.11";

}
