{ pkgs, ... }:

{
  home.packages = with pkgs; [ lazygit ];

  xdg.configFile."lazygit/config.yml".text = ''
    # Put your lazygit config here
  '';
}