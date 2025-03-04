return {
	"habamax/vim-godot",
	cmd = { "GodotRunLast", "GodotRun", "GodotRunCurrent", "GodotRunFZF" },
	ft = { "gdscript" },
	keys = {
		{ "<F4>", ":GodotRunLast<CR>" },
		{ "<F5>", ":GodotRun<CR>" },
		{ "<F6>", ":GodotRunCurrent<CR>" },
		{ "<F7>", ":GodotRunFZF<CR>" },
	},
}
