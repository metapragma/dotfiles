-- Space-leader keymaps that match the team's Neovim layout, so muscle memory
-- carries over when pairing. Kickstart's own maps stay; these are added on top.
--
-- Not mapped, because kickstart uses these keys as groups:
--   <leader>s*  Search (surround stays on mini.surround's sa / sd / sr)
--   <leader>t   Toggle (type definition stays on grt)

local map = vim.keymap.set
local builtin = require 'telescope.builtin'

-- Files and buffers
map('n', '<leader>e', builtin.find_files, { desc = 'Find files' })
map('n', '<leader>g', builtin.live_grep, { desc = 'Live grep' })
map('n', '<leader>b', builtin.buffers, { desc = 'Buffers' })
map('n', '<leader>q', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })
map('n', '<leader>Q', '<cmd>qall<CR>', { desc = 'Quit Neovim' })
map('n', '<Left>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<Right>', '<cmd>bnext<CR>', { desc = 'Next buffer' })

-- LSP
map('n', '<leader>d', builtin.lsp_definitions, { desc = 'Definitions' })
map('n', '<leader>i', builtin.lsp_implementations, { desc = 'Implementations' })
map('n', '<leader>R', builtin.lsp_references, { desc = 'References' })
map('n', '<leader>S', builtin.lsp_document_symbols, { desc = 'Document symbols' })
map('n', '<leader>W', builtin.lsp_dynamic_workspace_symbols, { desc = 'Workspace symbols' })
map('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol' })
map({ 'n', 'x' }, '<leader>A', vim.lsp.buf.code_action, { desc = 'Code action' })

-- Diagnostics
map('n', '<C-Down>', function() vim.diagnostic.jump { count = 1, float = true } end, { desc = 'Next diagnostic' })
map('n', '<C-Up>', function() vim.diagnostic.jump { count = -1, float = true } end, { desc = 'Previous diagnostic' })

-- Search: n always goes forward and N backward, whatever the search direction.
map({ 'n', 'x' }, 'n', "v:searchforward ? 'n' : 'N'", { expr = true, desc = 'Next search match' })
map({ 'n', 'x' }, 'N', "v:searchforward ? 'N' : 'n'", { expr = true, desc = 'Previous search match' })
map({ 'n', 'x' }, '<Down>', 'n', { remap = true, desc = 'Next search match' })
map({ 'n', 'x' }, '<Up>', 'N', { remap = true, desc = 'Previous search match' })

-- Help
map('n', '<leader>?', function() require('which-key').show { global = false } end, { desc = 'Buffer keymaps' })
