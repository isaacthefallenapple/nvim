-- Suppress git output message on commit
vim.keymap.set('n', 'cc', ':Git commit --quiet<CR>', { buffer = true, silent = true })
vim.keymap.set('n', 'ca', ':Git commit --amend --quiet<CR>', { buffer = true, silent = true })
vim.keymap.set('n', 'ce', ':Git commit --amend --no-edit --quiet<CR>', { buffer = true, silent = true })
