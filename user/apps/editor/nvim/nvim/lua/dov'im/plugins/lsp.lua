local lsp_zero_config = {
    call_servers = 'global',
}

local lsp_servers = {
    'lua_ls',
    'ccls',
    'pylsp',
    'hls',
    'rnix'
}

local lua_ls_config = {
    settings = {
        Lua = {
            diagnostics = {globals = {'vim'}},
            runtime = {version = 'LuaJIT'},
            telemetry = {enable = false},
        },
    },
}

local ccls_config = {
    init_options = {
        compilationDatabaseDirectory = "build",
        index = {
            threads = 0,
        },
        clang = {
            excludeArgs = { "-frounding-math"},
        },
    }
}

local hls_config = {
    settings = {
        filetypes = { 'haskell', 'lhaskell', 'cabal' },
    }
}

local rnix_config = {
    settings = {
        filetypes = { "nix" }
    }
}

local pylsp_config = {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 80
        },
      },
    },
  },
}

local function on_attach(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

return {
    "VonHeikemen/lsp-zero.nvim",
    event = "BufReadPre", -- lazy-load lsp-zero.nvim itself
    dependencies = {
        {
            "neovim/nvim-lspconfig", -- load nvim-lspconfig on BufReadPre (before loading Treesitter on BufReadPost)
            event = "BufReadPre",
        },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter", -- load nvim-cmp on InsertEnter; this is ignored(?), as nvim-cmp is loaded with lsp-zero.nvim
            dependencies = {
                { "hrsh7th/cmp-nvim-lsp" },
                { "L3MON4D3/LuaSnip" },
                { "saadparwaiz1/cmp_luasnip" },
                { "rafamadriz/friendly-snippets" },
            },
        },
    },

    config = function ()
        local lsp = require('lsp-zero')
        lsp.set_preferences(lsp_zero_config)

        lsp.configure('lua_ls', lua_ls_config)
        lsp.configure('ccls', ccls_config)
        lsp.configure('pylsp', pylsp_config)
        lsp.configure('hls', hls_config)
        lsp.configure('rnix', rnix_config)

        lsp.setup_servers(lsp_servers)
        lsp.on_attach(on_attach)
        lsp.setup()

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            sources = {
                {name = 'path'},
                {name = 'nvim_lsp'},
                {name = 'nvim_lua'},
            },
            formatting = lsp.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
        })
    end
}
