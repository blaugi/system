{
  den,
  ...
}:
{
  den.aspects.dev.git = {
    homeManager =
    { config, ... }:
    {
      programs = {
        git = {
          enable = true;

          branch = {
            autosetuprebase = "always";
          };

          color = {
            ui = "auto";
          };

          commit = {
            gpgsign = true;
          };

          diff = {
            mnemonicprefix = true;
          };

          init = {
            defaultBranch = "main";
          };
        };
      };
    };
  };
};
