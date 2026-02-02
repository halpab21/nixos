{ config, pkgs, ... }:
{
  networking.networkmanager = {
    ensureProfiles = {
      environmentFiles = [
        "/etc/nixos/wifi-secrets.env"
      ];

      profiles = {
        school-wifi = {
          connection = {
            id = "school-wifi";
            type = "wifi";
            interface-name = "wlo1";
            autoconnect = true;
          };
          
          wifi = {
            ssid = "S-Campus-Students";
            mode = "infrastructure";
          }; 
          wifi-security = {
            key-mgmt = "wpa-eap";
          };

          "802-1x" = {
            eap = "peap";
            identity = "$WIFI_IDENTITY";
            password = "$WIFI_PASSWORD";
            phase2-auth = "mschapv2";
          };

          ipv4.method = "auto";
          ipv6.method = "auto";

        };
      };
    };

  };

}
