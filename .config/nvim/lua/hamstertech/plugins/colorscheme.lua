function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
end

return {
	{
		"erikbackman/brightburn.vim",
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = {},
		config = function()
			-- ColorMyPencils()
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm", -- The theme comes in three styles, "storm", "moon" & "darker"
				tranparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a :terminal
				styles = {
					-- Style to be applied for different syntax groups
					-- Value is any valid attr-list value for :help nvim_set_hl
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles. Can be "dark", "transparent" & "normal"
					sidebards = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})
			ColorMyPencils()
		end,
	},
}
