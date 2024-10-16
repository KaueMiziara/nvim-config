local M = {}
-- Go
M.gopher = {
    plugin = true,
    n = {
        ["<leader>geh"] = {
            "<cmd> GoIfErr <CR>",
            "Generates if err != nil boilerplate",
        },
    }
}

-- DAP
M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line",
        },
        ["<leader>dr"] = {
            "<cmd> DapContinue <CR>",
            "Start or continue the debugger",
        },
        ["<leader>dus"] = {
            function()
                local widgets = require("dap.ui.widgets");
                local sidebar = widgets.sidebar(widgets.scopes);
                sidebar.open();
            end,
            "Open debugging sidebar"
        },
    }
}

M.dap_go = {
    plugin = true,
    n = {
        ["<leader>dgt"] = {
            function()
                require("dap-go").debug_test()
            end,
            "Debug Go test"
        },
        ["<leader>dgl"] = {
            function()
                require("dap-go").debug_last()
            end,
            "Debug last Go test"
        },
    }
}

M.dap_python = {
    plugin = true,
    n = {
        ["<leader>dpr"] = {
            function()
                require("dap-python").test_method()
            end
        }
    }
}

return M
