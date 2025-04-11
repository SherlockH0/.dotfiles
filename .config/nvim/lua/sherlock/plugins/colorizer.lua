return {
	"NvChad/nvim-colorizer.lua",
	event = "VeryLazy",
	config = function()
		require("colorizer").setup({
			user_default_options = {
				tailwind = true,
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
			},
		})
	end,
}
