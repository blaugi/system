{ pkgs }:

{
  enable = true;

    shellAliases ={
        ls = "eza --icons --grid --classify --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group";
        l = "eza";
        la = "ls -a";
        ll = "ls -lah"; 
    };


    shellAbbrs = {
        g = "git";
        ga = "git add";
        gaa = "git add --all";
        gapp = "git apply";
        gb = "git branch --verbose";
        gbr = "git branch --verbose --remotes";
        gbd = "git branch --delete";
        gbD = "git branch --delete --force";
        gc = "git commit -m";
        gca = "git commit --amend";
        gcl = "git clone";
        gco = "git checkout";
        gcot = "git checkout --theirs";
        gd = "git diff";
        gds = "git diff --staged";
        gf = "git fetch";
        gi = "git init";
        gP = "git push";
        gp = "git pull";
        gr = "git reset HEAD~";
        gR = "git restore";
        gra = "git remote add";
        gre = "git remote --verbose";
        gs = "git status";

        yz = "yazi";

        ca = "cargo add";
        cab = "cargo add --build";
        cad = "cargo add --dev";
        cb = "cargo build";
        cr = "cargo run";
        ct = "cargo test";
        crm = "cargo remove";
        crmb = "cargo remove --build";
        crmd = "cargo remove --dev";
        cc = "cargo clippy";
        cf = "cargo fmt";


        uva = "uv_add";
        uvv = "uv_venv";
        uvva = "uv_env_activate";
        
        cr = "code -r .";
        cl = "clear";
        e = "exit";
        l = "ls -l";
        n = "nvim";
        t = "tree";     
        lg="lazygit";
    };



    functions = {
        uv_venv = 
        ''
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
        '';

        uv_add =
        '' 
            uv add --active $argv
        ''; 

        uv_env_activate =
        '' 
            if test (count $argv) -lt 1
                echo "Usage: uv_env_activate <ENV_NAME>"
                return 1
            end

            set ENV_NAME $argv[1]
            set ENV_PATH "/uv_envs/$ENV_NAME/bin/activate.fish"

            if test -f "$ENV_PATH"
                source "$ENV_PATH"
                echo "Activated virtual environment: $ENV_NAME"
            else
                echo "Error: Virtual environment '$ENV_NAME' not found at $ENV_PATH"
                return 1
            end
        ''; 

        uv_remove_env =
        '' 
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
        ''; 

        y =
        '' 
          set tmp (mktemp -t "yazi-cwd.XXXXXX")
              yazi $argv --cwd-file="$tmp"
              if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
              builtin cd -- "$cwd"
            end
            rm -f -- "$tmp"
        ''; 



    };

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

    zoxide init fish --cmd cd | source

    function starship_transient_prompt_func
      starship module character
    end
    starship init fish | source
    enable_transience
  '';
}
