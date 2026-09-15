{ den, ... }:
{
  den.aspects.desktop = {
    includes = [
      den.aspects.shell
      # den.aspects.editors.zed
      den.aspects.editors.nvim
      den.aspects.editors.emacs
      den.aspects.dev
      den.aspects.base
    ];
  };
}
