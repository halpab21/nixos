{ system, inputs, config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.obsidian
  ];
}
