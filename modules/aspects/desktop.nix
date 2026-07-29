{ den, ... }:
{
  den.aspects.desktop = {
    includes = [
      den.aspects.base
      den.aspects.shell
      den.aspects.graphical
      den.aspects.editors
    ];
  };
}
