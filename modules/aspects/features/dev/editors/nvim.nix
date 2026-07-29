{den, ...}:
{
  den.aspects.editors.nvim = {
    homeManager = {pkgs, ...}:{
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
          nvim-cmp
        ];

        # ill use as is and incrementually grow this into something

        initLua = ''
          vim.g.mapleader = " "

          vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
          vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
        '';
      };
    };
  };
}
