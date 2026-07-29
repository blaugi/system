{ den, ... }:
{
  den.aspects.shell.starship = {
    homeManager = { ... }: {
      programs.starship = {
        enable = true;
        enableFishIntegration = true;
      };
    };
  };
}
