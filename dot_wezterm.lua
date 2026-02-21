local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.color_scheme = 'rose-pine-dawn'
config.font = wezterm.font 'JetBrains Mono'
config.window_decorations = 'RESIZE'
config.wsl_domains = {
  {
    name = 'Arch',
    distribution = 'Arch',
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
config.default_domain = 'Arch'

return config
