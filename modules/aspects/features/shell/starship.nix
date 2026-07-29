{ den, ... }:
{
  den.aspects.shell = {
    homeManager = { ... }: {
      programs.starship = {
        enable = true;
        enableFishIntegration = true;
      };
    };
  };
}
