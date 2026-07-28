{ den, ... }:
{
  den.aspects.cli = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        htop
        ripgrep
        fd
        bat
        eza
        fzf
        tmux
      ];
    };
  };
}
