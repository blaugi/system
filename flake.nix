{
  description = "Portable Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-fish.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, nixpkgs-fish, home-manager, stylix, ... }@inputs:
    let
      system = "x86_64-linux"; 
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsFish = nixpkgs-fish.legacyPackages.${system};

      username = "blau";
      homeDirectory = "/home/${username}";
    in {
      homeConfigurations = {
        headless = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          
          extraSpecialArgs = { 
            inherit inputs pkgsFish; 
            username = "azureuser";
            homeDirectory = "/home/azureuser";
            isHeadless = true;
          };
          
          modules = [
            stylix.homeModules.stylix
            ./home/default.nix
          ];
        };

        desktop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          
          extraSpecialArgs = { 
            inherit username homeDirectory inputs pkgsFish; 
            isHeadless = false;
          };
          
          modules = [
            stylix.homeModules.stylix
            ./home/default.nix
          ];
        };
      };
    };
}