return {
    -- gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = true,
    },

    -- tokyonight
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = { style = "moon" },
    },

    -- everforest
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
    },

    -- dracula
    {
        'Mofiqul/dracula.nvim',
        priority = 1000,
    },

    -- rose-pine
    { 'rose-pine/neovim', name = 'rose-pine' },

    -- catppuccin
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme everforest]])
    end,
    },


}
