return { -- plugins.lua
  "OXY2DEV/intro.nvim",
  config = function()
    require("intro").setup();
  end
}