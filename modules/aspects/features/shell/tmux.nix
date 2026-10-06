{ den, ... }:
{
  den.aspects.shell = {
    homeManager = { pkgs, ... }: {
      programs.tmux = {
        enable = true;
        clock24 = true;
        keyMode = "vi";
        baseIndex = 1;
        mouse = true;
        escapeTime = 0;
        terminal = "tmux-256color";
        plugins = with pkgs.tmuxPlugins; [
          sensible # Sensible defaults
          resurrect # Persist tmux sessions
          continuum # saving tmux
          vim-tmux-navigator # Seamless navigation between tmux panes and vim splits
          tmux-fzf
        ];
        shell = "${pkgs.fish}/bin/fish";
        extraConfig = ''
          # Automatically restore tmux sessions
          set -g @continuum-restore 'on'

          # Fast reload config inside tmux
          bind r source-file ~/.config/tmux/tmux.conf \; display-message "Tmux config reloaded."

          set-option -g renumber-windows on
        '';
      };
    };
  };
}
