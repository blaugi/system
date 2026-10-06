{ den, ... }:
{
  den.aspects.desktop = {
    includes = [
      den.aspects.shell
      den.aspects.editors.emacs
      den.aspects.editors.nvim
      den.aspects.dev
      den.aspects.base
    ];
  };
}
