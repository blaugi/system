{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    bat
    yazi
    eza
    btop
    dust
    ripgrep
    fd
    nerd-fonts.commit-mono
  ];

  programs.bat.enable = true;
  programs.yazi.enable = true;
  fonts.fontconfig.enable = true;

  # Modern Tmux configuration
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    baseIndex = 1;           # Start windows/panes at 1, not 0
    mouse = true;            # Enable mouse scrolling and clicking
    plugins = with pkgs.tmuxPlugins; [
      sensible               # Sensible defaults
      resurrect              # Persist tmux sessions across computer restarts
      continuum              # Continuous saving of tmux environment
      vim-tmux-navigator     # Seamless navigation between tmux panes and vim splits
    ];
    extraConfig = ''
      # Split panes using | and - (easier to remember)
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      # Automatically restore tmux sessions
      set -g @continuum-restore 'on'
      
      # Fast reload config inside tmux
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Tmux config reloaded."
    '';
  };
}