{
  den,
  ...
}:
{
  den.aspects.editors = {
    zed = {
      homeManager =
        {
          pkgs,
          config,
          ...
        }:
        {
          home.packages = with pkgs; [
            nixd
            nil
            zls
            cargo
            rustc
            rust-analyzer
            clippy
            typos
            typos-lsp
          ];
          programs.zed-editor = {
            enable = true;
            package = pkgs.zed-editor;
            extensions = [
              "nix"
              "dockerfile"
              "docker-compose"
              "git-firefly"
              "markdown-oxide"
              "toml"
              "typos"
              "csv"
              "basedpyright"
              "ty"
              "tokyo-night-dark"
            ];
            userKeymaps = [
              {
                context = "Editor && edit_prediction";
                bindings = {
                  "tab" = "editor::AcceptEditPrediction";
                  "alt-l" = null;
                };
              }
              {
                context = "Editor && edit_prediction_conflict";
                bindings = {
                  "alt-tab" = "editor::AcceptEditPrediction";
                  "alt-l" = null;
                };
              }
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
              };
              current_line_highlight = "line";
              tabs = {
                file_icons = true;
                git_status = true;
              };
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
