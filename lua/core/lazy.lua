-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Bootstap hotpot into lazy plugin dir if it does not exist yet.
local hotpotpath = vim.fn.stdpath 'data' .. '/lazy/hotpot.nvim'
if not vim.loop.fs_stat(hotpotpath) then
  vim.notify('Bootstrapping hotpot.nvim...', vim.log.levels.INFO)
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    -- You may with to pin a known version tag with `--branch=vX.Y.Z`
    '--branch=v0.9.6',
    'https://github.com/rktjmp/hotpot.nvim.git',
    hotpotpath,
  }
end

-- As per lazy's install instructions, but insert hotpots path at the front
vim.opt.runtimepath:prepend { hotpotpath, lazypath }

-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup('plugins', {
  change_detection = {
    notify = false,
  },
})
