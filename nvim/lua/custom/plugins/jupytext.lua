-- jupytext.nvim - Edit Jupyter notebooks (.ipynb) as regular text files
return {
  'GCBallesteros/jupytext.nvim',
  config = function()
    require('jupytext').setup({
      style = 'markdown', -- or 'light', 'percent'
      output_extension = 'md', -- or 'py'
      force_ft = 'markdown', -- or 'python'
    })
  end,
  -- Lazy load only when opening .ipynb files
  lazy = false,
}
