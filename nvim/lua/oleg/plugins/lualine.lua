-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  options = {
    component_separators = { left = '|', right = '|'},
    theme = 'nightfly',
    section_separators = '',
    },
})
