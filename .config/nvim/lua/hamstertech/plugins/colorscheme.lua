return {
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
			vim.cmd("colorscheme rose-pine")
			require("rose-pine").setup({
				disable_background = true,
			})
		end,
	},
}
