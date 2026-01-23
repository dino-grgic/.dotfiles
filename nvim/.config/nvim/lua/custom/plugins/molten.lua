-- Molten.nvim - Interactive Jupyter notebook integration for Neovim
return {
  'benlubas/molten-nvim',
  version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
  build = ':UpdateRemotePlugins',
  init = function()
    -- Configuration options (set before plugin loads)
    vim.g.molten_image_provider = 'none' -- Use 'none' for now, can be 'image.nvim' if you install it separately
    vim.g.molten_output_win_max_height = 20
    vim.g.molten_auto_open_output = false
    vim.g.molten_wrap_output = true
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
  end,
  config = function()
    -- Keybindings
    vim.keymap.set('n', '<leader>mi', ':MoltenInit<CR>', { desc = '[M]olten [I]nit kernel', silent = true })
    vim.keymap.set('n', '<leader>me', ':MoltenEvaluateOperator<CR>', { desc = '[M]olten [E]valuate operator', silent = true })
    vim.keymap.set('n', '<leader>ml', ':MoltenEvaluateLine<CR>', { desc = '[M]olten evaluate [L]ine', silent = true })
    vim.keymap.set('n', '<leader>mr', ':MoltenReevaluateCell<CR>', { desc = '[M]olten [R]e-evaluate cell', silent = true })
    vim.keymap.set('v', '<leader>me', ':<C-u>MoltenEvaluateVisual<CR>gv', { desc = '[M]olten [E]valuate visual', silent = true })
    vim.keymap.set('n', '<leader>md', ':MoltenDelete<CR>', { desc = '[M]olten [D]elete cell', silent = true })
    vim.keymap.set('n', '<leader>mo', ':MoltenShowOutput<CR>', { desc = '[M]olten show [O]utput', silent = true })
    vim.keymap.set('n', '<leader>mh', ':MoltenHideOutput<CR>', { desc = '[M]olten [H]ide output', silent = true })
    vim.keymap.set('n', '<leader>mx', ':MoltenInterrupt<CR>', { desc = '[M]olten interrupt e[X]ecution', silent = true })
  end,
}
