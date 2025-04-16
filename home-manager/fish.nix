{ pkgs }:

{
  enable = true;
  interactiveShellInit = ''
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    if test -f /anaconda/bin/conda
        eval /anaconda/bin/conda "shell.fish" "hook" $argv | source
    else
        if test -f "/anaconda/etc/fish/conf.d/conda.fish"
            . "/anaconda/etc/fish/conf.d/conda.fish"
        else
            set -x PATH "/anaconda/bin" $PATH
        end
    end
    # <<< conda initialize <<<

    # UV funcs

    function uv_venv
        if test (count $argv) -lt 2
            echo "Usage: uv_venv <ENV_NAME> <PYTHON_VERSION>"
            return 1
        end

        set ENV_NAME $argv[1]
        set PYTHON_VERSION $argv[2]
        set ENV_PATH "/uv_envs/$ENV_NAME"

        uv venv "$ENV_PATH" --python="$PYTHON_VERSION"

        if test $status -eq 0
            echo "Virtual environment created at $ENV_PATH"
        else
            echo "Failed to create virtual environment."
            return 1
        end
    end

    function uv_env_activate
        if test (count $argv) -lt 1
            echo "Usage: uv_env_activate <ENV_NAME>"
            return 1
        end

        set ENV_NAME $argv[1]
        set ENV_PATH "/uv_envs/$ENV_NAME/bin/activate"

        if test -f "$ENV_PATH"
            source "$ENV_PATH"
            echo "Activated virtual environment: $ENV_NAME"
        else
            echo "Error: Virtual environment '$ENV_NAME' not found at $ENV_PATH"
            return 1
        end
    end

    function uv_remove_env
        if test (count $argv) -lt 1
            echo "Usage: uv_remove_env <ENV_NAME>"
            return 1
        end

        set ENV_NAME $argv[1]
        set ENV_PATH "/uv_envs/$ENV_NAME"

        if test -d "$ENV_PATH"
            sudo rm -rf "$ENV_PATH"
            echo "Virtual environment removed: $ENV_NAME"
        else
            echo "Error: Virtual environment '$ENV_NAME' not found at $ENV_PATH"
            return 1
        end
    end

    #------------ aliases ------------ 
    alias ls="eza --icons --grid --classify --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group"
    alias l='eza'
    alias la='ls -a'
    alias ll='ls -lah'

    zoxide init fish --cmd cd | source

    set -Ux UV_LINK_MODE symlink

    function starship_transient_prompt_func
      starship module character
    end
    starship init fish | source
    enable_transience

    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
  '';
}