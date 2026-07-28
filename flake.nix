{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    den.url = "github:denful/den";
    import-tree.url = "github:denful/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

<<<<<<< HEAD
  outputs = { self, nixpkgs, nixpkgs-fish, home-manager, stylix, ... }@inputs:
    let
      system = "x86_64-linux"; 
      pkgs = import nixpkgs {
        inherit system;
      };
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
=======
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.den.flakeModule
        (inputs.import-tree ./modules)
      ];
      systems = [ "x86_64-linux" ]
>>>>>>> 73f0a73 (sync progress)
      };
    };
}
