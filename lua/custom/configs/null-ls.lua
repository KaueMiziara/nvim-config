local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
    sources = {
        null_ls.builtins.formatting.clang_format.with({
            extra_args = { "--style=Microsoft" },
            filetypes = { "c", "cpp", "h", "hpp" },
        }),

        null_ls.builtins.formatting.black.with({
            filetypes = { "python" }
        }),
        null_ls.builtins.diagnostics.mypy.with({
            filetypes = { "python" }
        }),
        null_ls.builtins.diagnostics.ruff.with({
            filetypes = { "python" }
        }),

        null_ls.builtins.formatting.gofmt.with({
            filetypes = { "go" }
        }),
        null_ls.builtins.formatting.goimports.with({
            filetypes = { "go" }
        }),
        null_ls.builtins.formatting.golines.with({
            filetypes = { "go" }
        }),
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end
}

return opts
