-- set colorscheme with protected call
-- nightfly, nightfox, duskfox, rose-pine

local specs = {
	all = {
		syntax = {
			-- Specs allow you to define a value using either a color or template. If the string does
			-- start with `#` the string will be used as the path of the palette table. Defining just
			-- a color uses the base version of that color.
			-- Adding either `.bright` or `.dim` will change the value
			field = "white.dim",
		},
		diag = {
			info = "red.base",
		},
	},
}

require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = false, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		module_default = true, -- Default enable value for modules
		styles = { -- Style to be applied to different syntax groups
			comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
			conditionals = "NONE",
			constants = "NONE",
			functions = "NONE",
			keywords = "NONE",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "NONE",
			variables = "NONE",
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
	palettes = {},
	specs = specs,
	groups = {},
})

local status, _ = pcall(vim.cmd, "colorscheme duskfox")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
