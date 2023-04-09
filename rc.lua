-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

require("errorHandling")
require("variablesDefinitions")
require("menu")

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

require("wibar")
require("mouseBindings")
require("keyBindings")
require("rules")
require("signals")

-- Run garbage collector regularly to prevent memory leaks
gears.timer {
    timeout = 300,
    autostart = true,
    callback = function() collectgarbage() end
}

require("autostarter")