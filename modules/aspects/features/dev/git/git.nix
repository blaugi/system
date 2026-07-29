{
  den,
  ...
}:
{
  den.aspects.dev = {
    homeManager =
      { config, ... }:
      {
        programs = {
          git = {
            enable = true;
          };
        };
      };
  };
}
