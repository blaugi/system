{
  description = "Portable Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      # Define your target system here, e.g., "x86_64-linux", "aarch64-darwin"
      system = "x86_64-linux"; 
      pkgs = nixpkgs.legacyPackages.${system};

      # Define the target username here. This decouples the config from a specific user.
      username = "azureuser";
      # Define the home directory path. e.g. /home/${username} or /Users/${username}
      homeDirectory = "/home/${username}";
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        
        # Pass variables to home.nix to ensure no hardcoded paths
        extraSpecialArgs = { 
          inherit username homeDirectory; 
        };
        
        modules = [
          ./home/default.nix
        ];
      };
    };
}