{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    yazi
    eza
    btop
    dust
    ripgrep
    fd
    nerd-fonts.commit-mono
    comma
    csvlens
  ];

  programs.neovim = {
    withPython3 = true;
    withRuby = false;
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      telescope-nvim
      nvim-treesitter.withAllGrammars
      telescope-zoxide
      neo-tree-nvim

      barbar-nvim
      nvim-web-devicons

      nvim-cmp
      obsidian-nvim
    ];

    # ill use as is and incrementually grow this into something
  
    initLua = ''
    vim.g.mapleader = " "

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
    vim.keymap.set("n", "<leader>e", "<cmd>Yazi<CR>", { desc = "Open Yazi" })
  '';
  };

  programs.bat.enable = true;
  programs.yazi.enable = true;
  programs.yazi.shellWrapperName= "yy";
  fonts.fontconfig.enable = true;
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

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
      sensible               # Sensible defaults
      resurrect              # Persist tmux sessions 
      continuum              # saving tmux 
      vim-tmux-navigator     # Seamless navigation between tmux panes and vim splits
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
}
