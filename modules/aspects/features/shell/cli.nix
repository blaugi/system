{ den, ... }:
{
  den.aspects.shell = {
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
