return {
    {
        -- LSP Auto Installer
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        -- Bridge from Mason to Lspconfig
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "pylsp",
                    "clangd",
                    "bashls",
                    "taplo",
                    "beautysh",
                    "black",
                    "clang-format",
                    "clangd",
                    "flake8",
                    "isort",
                    "prettier",
                    "pylsp",
                    "stylua",
                },
            })
        end,
    },

    {
        -- Connection to LSP servers
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.pylsp.setup({})
            lspconfig.clangd.setup({})
            lspconfig.bashls.setup({})
            lspconfig.taplo.setup({})

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
        end,
    },
}
