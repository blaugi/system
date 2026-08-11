{
  den.aspects.editors = {
    zed = {
      homeManager =
        {
          pkgs,
          ...
        }:
        {
          programs.zed-editor = {
            enable = true;
            package = pkgs.zed-editor;
            extensions = [
              "nix"
              "git-firefly"
              "markdown-oxide"
              "typos"
              "tokyo-night-dark"
            ];
            userSettings = {
              auto_update = false;
              buffer_font_family = "CommitMono Nerd Font";
              buffer_font_features = {
                calt = true;
              };
              ui_font_size = 16;
              buffer_font_size = 14;
              double_click_in_multibuffer = "open";
              theme = {
                mode = "system";
                dark = "tokyo-night-dark";
                light = "One Light";
              };
              current_line_highlight = "line";
              terminal = {
                line_height = "standard";
                env = { };
                font_family = "CommitMono Nerd Font";
                copy_on_select = true;
              };
              indent_guides = {
                enabled = true;
                coloring = "indent_aware";
              };
              soft_wrap = "editor_width";
              inlay_hints = {
                enabled = true;
              };
              languages = {
                Python = {
                  language_servers = [
                    "ty"
                    "ruff"
                    "!basedpyright"
                  ];
                };
                Nix = {
                  language_servers = [ "nil" ];
                };
              };
            };
          };
        };
    };
  };
}
