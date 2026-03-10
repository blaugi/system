{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    # Optional: Enhance git diffs visually via delta
    delta = {
      enable = true;
      options = {
        features = "side-by-side line-numbers decorations";
      };
    };

  home.packages = with pkgs; [ lazygit ];

  xdg.configFile."lazygit/config.yml".text = ''
    # Put your lazygit config here
  '';
}