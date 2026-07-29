{ den, ... }:
{
  den.aspects.shell.cli = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        bat
        yazi
        eza
        btop
        dust
        ripgrep
        fd
      ];
    };
  };
}
