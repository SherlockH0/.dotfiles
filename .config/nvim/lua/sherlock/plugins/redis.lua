return {
	"recap/nvim-redis",
	cmd = { "RSetParams", "RListKeys", "RGetKey", "RHGetKey" },
	config = function()
		require("redis").setup()
	end,
}
