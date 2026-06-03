-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
-- 只保留 LazyVim 默认没有的映射；其余功能请用 LazyVim 自带快捷键（见 KEYMAPS.md）

-- Text objects: inside (...) after '(' / first word after '('
-- Usage: vi(  di(  ci(  /  viw  diw  ciw  (with inw)
vim.keymap.set("o", "in(", "<Cmd>normal! f(vi(<CR>", { desc = "Inside ( ... ) after (" })
vim.keymap.set("o", "inw", "<Cmd>normal! f(lviw<CR>", { desc = "Inside word after (" })

-- Wrap selection / word with pairs (LazyVim 默认无 surround，除非启用 mini.surround extra)
local wrap_pairs = {
  ['"'] = { visual = [[<Esc>a"<Esc>`<i"<Esc>`>2l]], normal = [[viw<Esc>a"<Esc>`<i"<Esc>`>2l]] },
  ["'"] = { visual = [[<Esc>a'<Esc>`<i'<Esc>`>2l]], normal = [[viw<Esc>a'<Esc>`<i'<Esc>`>2l]] },
  ["("] = { visual = [[<Esc>a)<Esc>`<i(<Esc>`>2l]], normal = [[viw<Esc>a)<Esc>`<i(<Esc>`>2l]] },
  ["["] = { visual = [[<Esc>a]<Esc>`<i[<Esc>`>2l]], normal = [[viw<Esc>a]<Esc>`<i[<Esc>`>2l]] },
  ["{"] = { visual = [[<Esc>a}<Esc>`<i{<Esc>`>2l]], normal = [[viw<Esc>a}<Esc>`<i{<Esc>`>2l]] },
}

for char, maps in pairs(wrap_pairs) do
  local key = "<leader>" .. char
  vim.keymap.set("v", key, maps.visual, { desc = "Wrap selection with " .. char, silent = true })
  vim.keymap.set("n", key, maps.normal, { desc = "Wrap word with " .. char, silent = true })
end

-- Search in current file → Location List（LazyVim 默认无等价映射）
vim.keymap.set("n", "<leader>fw", function()
  local word = vim.fn.expand("<cword>")
  if word == "" then
    return
  end
  vim.fn.setreg("/", word)
  vim.cmd.lvimgrep("/" .. word .. "/", "%")
  vim.cmd.lw()
end, { desc = "Search word in buffer (loclist)" })

vim.keymap.set("n", "<leader>fs", function()
  vim.cmd.lvimgrep("//", "%")
  vim.cmd.lw()
end, { desc = "Search last pattern in buffer (loclist)" })
