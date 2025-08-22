{ config, pkgs, ... }:

{
  home.username = "azureuser";
  home.homeDirectory = "/home/azureuser";

  # Use the current released HM state version you installed. Change only after reading docs.
  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  home.packages = with pkgs; [
    uv
    fish
    neovim
    lazygit
    bat
    zoxide
    starship
    yazi
    eza
    nerd-fonts.commit-mono
  ];

  fonts.fontconfig.enable = true;

  programs.fish = import ./fish.nix { inherit pkgs; };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd" "cd" ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.bat.enable = true;
  programs.yazi.enable = true;

  xdg.configFile."lazygit/config.yml".text = ''
    # Put your lazygit config here
  '';

  programs.home-manager.enable = true;
  home.sessionPath = [
    "$HOME/.nix-profile/bin"
    "/nix/profile/bin"
  ];
}

