-- Neovim config: the settings from ~/.vimrc, plus a file explorer (nvim-tree)
-- and Python go-to-definition / find-references (pyright language server).

-- nvim-tree replaces the built-in netrw explorer; netrw must be disabled first.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.auto_save = 1
vim.g.sonokai_style = 'atlantis'

-- Built-in plugin manager. Plugins are downloaded on first start, at the
-- revisions recorded in nvim-pack-lock.json. Update them with :lua vim.pack.update()
vim.pack.add({
  'https://github.com/nvim-tree/nvim-tree.lua',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/907th/vim-auto-save',
  'https://github.com/sainnhe/sonokai',
}, { confirm = false })

-- Options from ~/.vimrc (the ones that are already Neovim defaults are left out)
vim.opt.textwidth = 80
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.opt.scrolloff = 35
vim.opt.path = vim.env.PWD .. '/**'
vim.opt.switchbuf:append({ 'usetab', 'newtab' })
vim.opt.complete = '.'

vim.cmd.colorscheme('sonokai')

-- Colors from ~/.vimrc, applied on top of the theme. Neovim uses 24-bit color,
-- so each color is given for both 24-bit (bg/fg) and 256-color (ctermbg/ctermfg) terminals.
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#262626', ctermbg = 235 })
vim.api.nvim_set_hl(0, 'Visual', { fg = 'Black', bg = 'White', ctermfg = 0, ctermbg = 15 })
vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#262626', ctermbg = 235, fg = 'White', ctermfg = 15 })
  end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#262626', ctermbg = 235 })
  end,
})

-- Mappings from ~/.vimrc
vim.keymap.set('n', 'f', '/')
vim.keymap.set('n', '<Space>', 'i<Space><Esc>')
vim.keymap.set('', '<C-P>', '<Nop>')
vim.keymap.set('', ';', 'l')
vim.keymap.set('', 'l', 'k')
vim.keymap.set('', 'k', 'j')
vim.keymap.set('', 'j', 'h')

-- :FF and :F commands from ~/.vimrc, unchanged
vim.cmd([[
" find files and populate the quickfix list
fun! FindFiles(filename)
  let error_file = tempname()
  silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfun
command! -nargs=1 FF call FindFiles(<q-args>) | redraw!

" Execute grep recursive grep -> skip ENTER window -> redraw the output -> open the location list
command -nargs=* -complete=file F silent execute "lgrep! -inr -I <args>" | redraw! | lopen 30
]])

-- File explorer, set up like the NERDTree settings in ~/.vimrc. Icons are
-- plain characters because the terminal font is not a Nerd Font.
require('nvim-tree').setup({
  view = { width = 60, number = true, relativenumber = true },
  renderer = {
    icons = {
      show = { file = false, folder = false, git = false },
      glyphs = { bookmark = '*', folder = { arrow_closed = '▸', arrow_open = '▾' } },
    },
  },
})
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    require('nvim-tree.api').tree.open()
  end,
})

-- Python language server (installed with npm). Neovim's default LSP keymaps
-- then work in Python files: CTRL-] goes to the definition, grr lists the uses.
vim.lsp.enable('pyright')
