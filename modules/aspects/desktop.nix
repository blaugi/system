{ den, ... }:
{
  den.aspects.desktop = {
    includes = [
      den.aspects.shell
      den.aspects.editors.zed
      den.aspects.editors.nvim
      den.aspects.dev
      den.aspects.base
    ];
  };
}
