{ den, ... }:
{
  den.aspects.headless = {
    includes = [
      den.aspects.editors.nvim
      den.aspects.editors.emacs
      den.aspects.dev
      den.aspects.shell
      den.aspects.base
    ];
  };
}
