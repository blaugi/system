{
  den.aspects.editors.emacs= {
    homeManager = { pkgs, ... }: {
      programs.emacs= {
        enable = true;
      };
    };
  };
}
