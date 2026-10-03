local mainMod = "SUPER"
hl.config({
	scrolling = {
		explicit_column_widths = "0.5, 1.0",
	},
})

hl.bind("SUPER + F", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty yazi"))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("noctalia msg volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("noctalia msg volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("noctalia msg volume-mute"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("noctalia msg settings-toggle"))
hl.bind(mainMod .. " + CTRL + RETURN", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center audio"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center media"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + bracketleft", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + bracketright", hl.dsp.window.move({ direction = "right" }))

hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.swap({ direction = "down" }))

hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))

for i = 1, 9 do
	-- Mod+1 ... Mod+9
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))

	-- Mod+Ctrl+1 ... Mod+Ctrl+9
	hl.bind(mainMod .. " + CTRL + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + MINUS", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))

hl.bind(mainMod .. " + EQUAL", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))

hl.bind(mainMod .. " + SHIFT + MINUS", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))

hl.bind(mainMod .. " + SHIFT + EQUAL", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))

hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())

hl.bind("CTRL + SHIFT + 1", hl.dsp.exec_cmd("noctalia msg screenshot-region"))

hl.bind("CTRL + ALT + DELETE", hl.dsp.exit())

-------------------------
---Applications hotkey---
-------------------------

hl.bind(
	"CTRL + SHIFT + M",
	hl.dsp.pass({
		window = "class:^(discord)$",
	})
)
hl.bind(
	"mouse:276",
	hl.dsp.send_shortcut({
		mods = "",
		key = "mouse:278",
		window = "class:^(discord)$",
	})
)

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
