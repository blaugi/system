{ den, ... }:
{
  den.aspects.desktop = {
    includes = [
      den.aspects.base
      den.aspects.cli
      den.aspects.graphical
    ];
  };
}
