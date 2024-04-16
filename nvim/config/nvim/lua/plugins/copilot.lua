return {
  {
    "github/copilot.vim",
    name = "copilot",
    priority = 1000,
    config = function()
        vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
    end
  }
}
