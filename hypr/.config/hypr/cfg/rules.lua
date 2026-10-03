-- Cursor not change focused windows

hl.config({
	cursor = {
		no_warps = true,
		warp_on_change_workspace = 0,
	},
})

--Maximize on solo window
--
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

--floatin on center
--
hl.window_rule({
	name = "steam-popups",
	match = {
		initial_class = "^steam$",
		initial_title = "negative:^Steam$",
	},
	float = true,
})
--hl.window_rule({
--match = { float = true },
--center = true,
--})
