{ pkgs, pkgsFish, ... }:

{
  programs.fish = {
    enable = true;
    package = pkgsFish.fish;

    shellAliases = {
      ls = "eza -al --color=always --group-directories-first --icons"; 
      la = "eza -a --color=always --group-directories-first --icons";
      ll = "eza -l --color=always --group-directories-first --icons";
      lt = "eza -aT --color=always --group-directories-first --icons";
      "l." = "eza -a | grep -e '^\\.'";

      ".." = "cd ..";
      yz = "yazi";
      n = "nvim";
      lg = "lazygit";
      cl = "clear";
      e = "exit";
    };

    shellAbbrs = {
      gs = "git status";
      uva = "uv_add";
      uvv = "uv_venv";
      uvva = "uv_env_activate";
      coder = "code -r .";
      t = "tree";
    };

    functions = {
      uv_venv = ''
        if test (count $argv) -lt 1
          echo "Usage: uv_venv <ENV_NAME>"
          return 1
        end
        set ENV_NAME $argv[1]
        set ENV_PATH "$HOME/localfiles/uv_venvs/$ENV_NAME"
        uv venv "$ENV_PATH"
        if test $status -eq 0
          echo "Virtual environment created at $ENV_PATH"
        else
          echo "Failed to create virtual environment."
          return 1
        end
      '';

      uv_add = ''
        uv add --active $argv
      '';

      uv_env_activate = ''
        if test (count $argv) -lt 1
          echo "Usage: uv_env_activate <ENV_NAME>"
          return 1
        end
        set ENV_NAME $argv[1]
        set ENV_PATH "$HOME/localfiles/uv_venvs/$ENV_NAME/bin/activate.fish"
        if test -f "$ENV_PATH"
          source "$ENV_PATH"
          echo "Activated virtual environment: $ENV_NAME"
        else
          echo "Error: Virtual environment '$ENV_NAME' not found at $ENV_PATH"
          return 1
        end
      '';

      uv_remove_env = ''
        if test (count $argv) -lt 1
          echo "Usage: uv_remove_env <ENV_NAME>"
          return 1
        end
        set ENV_NAME $argv[1]
        set ENV_PATH "$HOME/localfiles/uv_venvs/$ENV_NAME"
        if test -d "$ENV_PATH"
          sudo rm -rf "$ENV_PATH"
          echo "Virtual environment removed: $ENV_NAME"
        else
          echo "Error: Virtual environment '$ENV_NAME' not found at $ENV_PATH"
          return 1
        end
      '';

      y = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and test -n "$cwd"; and test "$cwd" != "$PWD"
          builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };

    loginShellInit = ''
      if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
        source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
      else if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        command -q bass; and bass source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      end
    '';

    shellInit = ''
      set -l hmvars "$HOME/.nix-profile/etc/profile.d/hm-session-vars.fish"
      if test -f $hmvars
        source $hmvars
      end

      set -gx CONDA_AUTO_ACTIVATE_BASE false
      set -gx CONDA_ROOT /anaconda
      if test -f $CONDA_ROOT/etc/fish/conf.d/conda.fish
        source $CONDA_ROOT/etc/fish/conf.d/conda.fish
      else if test -x $CONDA_ROOT/bin/conda
        eval ($CONDA_ROOT/bin/conda shell.fish hook)
      end
    '';

    interactiveShellInit = ''
      function starship_transient_rprompt_func
        starship module time
      end

      starship init fish | source
      enable_transience

    '';

    plugins = [
      {
        name = "fzf.fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd" "cd" ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  # Make fzf search much smarter and faster using fd and bat
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    tmux.enableShellIntegration = true;
    defaultCommand = "fd --type f --hidden --exclude .git";
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--inline-info"
    ];
    fileWidgetCommand = "fd --type f --hidden --exclude .git";
    fileWidgetOptions = [
      "--preview 'bat --style=numbers --color=always --line-range :500 {}'"
    ];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}