{
  den.aspects.desktop = {
    homeManager = {
      fonts = {
        fontconfig = {
          enable = true;
        };
        packages = with pkgs; [
          nerd-fonts.commit-mono
          atkinson-hyperlegible

        ];
      };
    };
  };
}
