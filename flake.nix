{
  description = "Portable Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
    let
      # Define your target system here, e.g., "x86_64-linux", "aarch64-darwin"
      system = "x86_64-linux"; 
      pkgs = nixpkgs.legacyPackages.${system};

      # Define the target username here. This decouples the config from a specific user.
      username = "azureuser";
      # Define the home directory path. e.g. /home/${username} or /Users/${username}
      homeDirectory = "/home/${username}";
    in {
      homeConfigurations = {
        work = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          
          extraSpecialArgs = { 
            inherit username homeDirectory inputs; 
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
            inherit username homeDirectory inputs; 
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