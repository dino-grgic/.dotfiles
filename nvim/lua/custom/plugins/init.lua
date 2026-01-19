-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Import molten.nvim for Jupyter integration
  require 'custom.plugins.molten',
  -- Import jupytext.nvim to edit .ipynb files
  require 'custom.plugins.jupytext',
}
