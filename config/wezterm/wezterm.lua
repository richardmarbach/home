local wezterm = require("wezterm")
wezterm.add_to_config_reload_watch_list(wezterm.config_dir)

return {
	color_scheme = "Gruvbox dark, soft (base16)",
	font = wezterm.font("Hack"),
	font_size = 11,
	enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	enable_kitty_keyboard = true,
	window_decorations = "NONE",
	window_padding = {
		left = 2,
		right = 2,
		top = 2,
		bottom = 2,
	},
}
