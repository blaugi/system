{ ... }:
{
  den.aspects.desktop = {
    homeManager = { pkgs, ... }: {
      fonts.fontconfig = {
        enable = true;
      };
      home.packages = with pkgs; [
        nerd-fonts.commit-mono
        atkinson-hyperlegible
      ];
    };
  };
}