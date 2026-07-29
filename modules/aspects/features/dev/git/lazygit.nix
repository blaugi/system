{
  den,
  ...
}: {
  den.aspects.dev.git = {
    homeManager = {
      programs = {
        lazygit = {
          enable = true;

          settings = {
            git.overrideGpg = true;
          };
        };
      };
    };
  };
}
