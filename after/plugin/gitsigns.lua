require('gitsigns').setup()

function SetSignColors()
    vim.cmd('highlight GitSignsAdd guibg=NONE')
    vim.cmd('highlight GitSignsChange guibg=NONE')
    vim.cmd('highlight GitSignsDelete guibg=NONE')

    vim.cmd('highlight GitSignsAdd guifg=lightgreen')
    vim.cmd('highlight GitSignsChange guifg=cyan')
    vim.cmd('highlight GitSignsDelete guifg=red')
end

SetSignColors()
