{ den, ... }:
{
  den.aspects.headless = {
    includes = [
      den.aspects.editors.nvim
      den.aspects.dev
      den.aspects.shell
    ];
  };
}
