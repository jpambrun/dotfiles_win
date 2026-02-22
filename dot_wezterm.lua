local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.color_scheme = 'rose-pine-dawn'
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
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
}

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

local function starts_with(s, prefix)
  return s:sub(1, #prefix) == prefix
end

local function is_home_like_path(path, user, domain)
  if not path or path == '' then
    return false
  end
  local p = path:gsub('\\', '/')
  if p == '~' or starts_with(p, '~/') then
    return true
  end
  if user ~= '' then
    if starts_with(p, '/home/' .. user) then
      return true
    end
    if starts_with(p, 'file:///home/' .. user) then
      return true
    end
    if domain ~= '' then
      if starts_with(p, '//wsl.localhost/' .. domain .. '/home/' .. user) then
        return true
      end
      if starts_with(p, '//wsl$/' .. domain .. '/home/' .. user) then
        return true
      end
    end
  end
  return false
end

wezterm.on('mux-is-process-stateful', function(proc)
  local user = os.getenv('USER') or os.getenv('USERNAME') or ''
  local domain = config.default_domain or ''
  if proc then
    for _, v in pairs(proc) do
      if type(v) == 'string' and is_home_like_path(v, user, domain) then
        return false
      end
    end
  end

  return nil
end)

return config
