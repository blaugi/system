{ den, ... }:
{
  den.aspects.shell = {
    homeManager = { pkgs, ... }: {
      programs.tmux = {
        enable = true;
        clock24 = true;
        keyMode = "vi";
        baseIndex = 1;
        shortcut = "space";
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

          # Theme: borders
          set -g pane-border-lines simple
          set -g pane-border-style fg=black,bright
          set -g pane-active-border-style fg=magenta

          # Theme: status
          set -g status-style bg=default,fg=black,bright
          set -g status-left ""
          set -g status-right "#[fg=black,bright]#S"
        '';
      };
    };
  };
}
