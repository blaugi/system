{
  den.aspects.editors.nvim = {
    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.neovim ];
    };
  };
}
