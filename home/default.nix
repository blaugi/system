{ config, pkgs, username, homeDirectory, ... }:

{
  home.username = username;
  home.homeDirectory = homeDirectory;
  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;

  imports = [
    ./modules/shell/fish.nix
    ./modules/tools/cli.nix
    ./modules/tools/git.nix
    ./modules/dev/default.nix
    ./modules/theme/default.nix
  ];

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  programs.home-manager.enable = true;
  
  home.sessionPath = [
    "$HOME/.nix-profile/bin"
    "/nix/profile/bin"
  ];
}