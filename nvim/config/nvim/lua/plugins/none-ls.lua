return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,       -- Lua
                null_ls.builtins.formatting.black,        -- Python
                null_ls.builtins.formatting.isort,        -- Python
                null_ls.builtins.formatting.clang_format, -- C/C++
                null_ls.builtins.formatting.prettier,     -- JavaScript, Markdown, JSON, etc.
                null_ls.builtins.formatting.shfmt,        -- Shell, replacing beautysh
                --null_ls.builtins.diagnostics.flake8.with({
                --    command = "/home/lodomo/.local/share/nvim/mason/bin/flake8",
                --}),
            },
        })

        -- Sends a format request
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        vim.lsp.set_log_level("debug")
    end,
}
