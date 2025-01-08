local plugins = {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            opts = require "plugins.configs.treesitter"
            opts.ensure_installed = {
                "lua",
                "go",
                "haskell",
                "rust",
                "javascript",
                "php",
                "typescript",
                "tsx",
            }
            return opts
        end
    },
    -- DAP
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "nvim-neotest/nvim-nio",
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_, _)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("core.utils").load_mappings("dap_python")
        end
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings("dap_go")
        end
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            require("core.utils").load_mappings("dap")
        end
    },

    -- LSP
    -- {
    --     "nvimtools/none-ls.nvim",
    --     event = "VeryLazy",
    --     opts = function()
    --         return require "custom.configs.null-ls"
    --     end
    -- },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.null-ls"
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },

    -- Mason
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "codelldb",

                "rust-analyzer",

                "black",
                "debugpy",
                "mypy",
                "ruff",
                "pyright",

                "gopls",

                "haskell-language-server",

                "eslint-lsp",
                "typescript-language-server",
                "tailwindcss-language-server",

                "intelephense",
                "phpactor",

                "zls",
            }
        }
    },
    -- Rust
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function()
            return require "custom.configs.rust-tools"
        end,
        config = function(_, opts)
            require('rust-tools').setup(opts)
        end
    },
    -- Go
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
            require("core.utils").load_mappings("gopher")
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },
    -- React
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },
    -- PHP
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-dotenv",
        },
        opts = {
            split_panel = true,
            artisan_command_aliases = true,
        },
    },
    {
        "rcarriga/nvim-notify",
    },
}

return plugins
