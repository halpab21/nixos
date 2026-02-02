{

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @inputs: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
  {
    nixosConfigurations.medion = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system; };

      modules = [
        {
          nix.settings.experimental-features = ["nix-command" "flakes"]; 
        }
        ./hosts/medion.nix
      ];
    };

  };
  
}
