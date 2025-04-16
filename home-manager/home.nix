{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "azureuser";
  home.homeDirectory = "/home/azureuser";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Install all requested tools and fonts
  home.packages = with pkgs; [
    fish
    lazygit
    bat
    zoxide
    starship
    yazi
    eza
    nerd-fonts.commit-mono
  ]; 

  fonts.fontconfig.enable = true;

  # Import the fish shell setup from a separate nix file
  programs.fish = import ./fish.nix { inherit pkgs; };

  programs.zoxide = {
      enable = true;
      options = [
        "--cmd"
        "c"
      ];
    };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.bat.enable = true;

  xdg.configFile."lazygit/config.yml".text = ''
    # Put your lazygit config here
  '';

  programs.yazi = {
    enable = true;
  };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
