return {
	"malbertzard/inline-fold.nvim",

	opts = {
		defaultPlaceholder = "…",
		queries = {

			-- Some examples you can use
			html = {
				{ pattern = 'href="(.-)"', placeholder = "󰌷 " }, -- hrefs in html
				{ pattern = 'd="(.-)"', placeholder = "󰕡 " }, -- svg paths
				{ pattern = 'src="(.-)"', placeholder = "󰉏 " }, -- HTML img src attribute
			},

			htmldjango = {
				{ pattern = 'd="(.-)"', placeholder = "󰕡 " }, -- svg paths
			},
		},
	},
}
