{ system, inputs, config, pkgs, ... }:
{
  environment.systemPackages = [
    inputs.winapps.packages."${system}".winapps
    inputs.winapps.packages."${system}".winapps-launcher
    pkgs.freerdp
  ];
  environment.variables = {
    WINAPPS_X11 = "1";
  };
}
