local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'FiraMono'

config.color_scheme = 'Gruvbox Dark (Gogh)'

config.initial_cols = 155
config.initial_rows = 155


return config
