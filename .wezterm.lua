-- Helper Functions
local wt_action = require("wezterm").action
local key_table = function(mods, key, action)
	return {
		mods = mods,
		key = key,
		action = action,
	}
end
local cmd_key = function(key, action)
	return key_table("CMD", key, action)
end
local cmd_to_tmux_prefix = function(key, tmux_key)
	return cmd_key(
		key,
		wt_action.Multiple({
			wt_action.SendKey({ mods = "CTRL", key = "Space" }),
			wt_action.SendKey({ key = tmux_key }),
		})
	)
end

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- my coolnight colorscheme
--
config.colors = {
	-- foreground = "#CBE0F0",
	-- background = "#011423",
	-- background = "#01101D",
	-- background = "#000F1D",
	background = "#000",
	-- cursor_bg = "#47FF9C",
	-- cursor_border = "#47FF9C",
	-- cursor_bg = "#CBE0F0",
	-- cursor_border = "#CBE0F0",
	-- cursor_fg = "#011423",
	-- selection_bg = "#033259",
	-- selection_fg = "#CBE0F0",
	-- ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	-- brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}
-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#16181a",
-- 	-- background = "#011423",
-- 	cursor_bg = "#CBE0F0",
-- 	cursor_border = "#CBE0F0",
-- 	-- cursor_bg = "#47FF9C",
-- 	-- cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#033259",
-- 	selection_fg = "#CBE0F0",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }
-- cyberdream theme for wezterm
-- config.colors = {
-- 	foreground = "#ffffff",
-- 	background = "#16181a",
--
-- 	cursor_bg = "#ffffff",
-- 	cursor_fg = "#16181a",
-- 	cursor_border = "#ffffff",
--
-- 	selection_fg = "#ffffff",
-- 	selection_bg = "#3c4048",
--
-- 	scrollbar_thumb = "#16181a",
-- 	split = "#16181a",
--
-- 	ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
-- 	brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
-- 	indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
-- }
-- config.window_background_image = "/Users/felix/repos/github.com/fenagel/dotfiles/bg-blurred-darker.png"
-- config.macos_window_background_blur = 30
-- config.color_scheme = "tokyonight"
-- config.color_scheme = "Tomorrow Night"
config.color_scheme = "GruvboxDarkHard"
-- config.color_scheme = "Rosé Pine (base16)"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 24

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.window_padding = {
	left = 40,
	right = 20,
	top = 30,
	bottom = 20,
}
-- config.macos_window_background_blur = 10
config.keys = {
	cmd_to_tmux_prefix("1", "1"),
	cmd_to_tmux_prefix("2", "2"),
	cmd_to_tmux_prefix("3", "3"),
	cmd_to_tmux_prefix("4", "4"),
	cmd_to_tmux_prefix("5", "5"),
	cmd_to_tmux_prefix("6", "6"),
	cmd_to_tmux_prefix("7", "7"),
	cmd_to_tmux_prefix("8", "8"),
	cmd_to_tmux_prefix("9", "9"),
	cmd_to_tmux_prefix("`", "n"),
	cmd_to_tmux_prefix("b", "b"),
	cmd_to_tmux_prefix("C", "C"),
	cmd_to_tmux_prefix("d", "D"),
	cmd_to_tmux_prefix("G", "G"),
	cmd_to_tmux_prefix("g", "g"),
	cmd_to_tmux_prefix("j", "J"),
	cmd_to_tmux_prefix("K", "T"),
	cmd_to_tmux_prefix("k", "K"),
	cmd_to_tmux_prefix("l", "L"),
	cmd_to_tmux_prefix("n", '"'),
	cmd_to_tmux_prefix("N", "%"),
	cmd_to_tmux_prefix("o", "u"),
	cmd_to_tmux_prefix("T", "B"),
	cmd_to_tmux_prefix("Y", "Y"),
	cmd_to_tmux_prefix("t", "c"),
	cmd_to_tmux_prefix("w", "x"),
	cmd_to_tmux_prefix("z", "z"),
	cmd_to_tmux_prefix("Z", "Z"),
}

-- and finally, return the configuration to wezterm
return config
