ANIME = {
  { "02.txt", 54, 26 },
  { "Ayanami.txt", 59, 32 },
  { "Asuka.txt", 167, 34 },
  { "Berserk.txt", 167, 34 },
}

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
      -- Load required modules
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      require("alpha.term")

      -- Set Header
      dashboard.opts.opts.noautocmd = true
      dashboard.section.terminal.opts.redraw = true
      
      local idx = math.random(1, #ANIME)
      local info = ANIME[3]

      path = "~/.config/nvim/lua/plugins/headers/"

      dashboard.section.terminal.command = "cat " .. path .. info[1]
      dashboard.section.terminal.width = info[2]
      dashboard.section.terminal.height = info[3]
      dashboard.section.terminal.opts.window_config.border = "rounded"

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
        dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
        dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
        dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
        dashboard.button("c", " " .. " Config",          "<cmd> lua require('lazyvim.util').telescope.config_files()() <cr>"),
        dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
        dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
        dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
        dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
      }

      dashboard.opts.layout = {
        { type = "padding", val = 2 },
        dashboard.section.terminal,
        { type = "padding", val = 4 },
        dashboard.section.buttons,
        dashboard.section.footer,
    }

      -- Send config to Alpha
      alpha.setup(dashboard.opts)
  end,
}
