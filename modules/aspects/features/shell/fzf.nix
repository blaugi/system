{ den, ... }:
{
  den.aspects.shell = {
    homeManager = { ... }: {
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
    };
  };
}
