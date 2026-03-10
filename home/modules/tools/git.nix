{ pkgs, ... }:

{
  programs=  {
    git.enable = true;

    delta = {
      enable = true;
      options = {
        features = "side-by-side line-numbers decorations";
      };
      enableGitIntegration = true;
    };
  };
   

  home.packages = with pkgs; [ lazygit ];

  xdg.configFile."lazygit/config.yml".text = ''
    # Put your lazygit config here
  '';
}