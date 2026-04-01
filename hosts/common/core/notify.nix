{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
            dunst
            libnotify
  ];

  services.dbus.enable = true;

}
