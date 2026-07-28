{ den, ... }:
{
  den.aspects.headless = {
    includes = [
      den.aspects.base
      den.aspects.cli
    ];
  };
}
