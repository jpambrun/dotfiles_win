local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.color_scheme = 'rose-pine-dawn'
config.colors = config.colors or {}
config.colors.selection_fg = "#575279"  -- text color when selected
config.colors.selection_bg = "#c4a7e7"  -- visible highlight
config.font = wezterm.font 'Monaspace Neon'
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'
config.wsl_domains = {
  {
    name = 'arch',
    distribution = 'arch',
    default_cwd = "~"
  },
}
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false  -- optional: move it to the bottom

config.colors = config.colors or {}
config.colors.tab_bar = {
  background = "#faf4ed", -- match your rose-pine-dawn-ish frame
  active_tab = { bg_color = "#fffaf3", fg_color = "#575279" },
  inactive_tab = { bg_color = "#faf4ed", fg_color = "#797593" },
  inactive_tab_hover = { bg_color = "#f2e9e1", fg_color = "#575279" },
  new_tab = { bg_color = "#faf4ed", fg_color = "#575279" },
  new_tab_hover = { bg_color = "#f2e9e1", fg_color = "#575279" },
}
config.default_domain = 'arch'

return config
