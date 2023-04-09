-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
local naughty = require("naughty")

-- Create a launcher widget and a main menu
myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
 }

 mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                     { "open terminal", terminal }
                                   }
                         })

 mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                      menu = mymainmenu })

 -- Menubar configuration
 menubar.utils.terminal = terminal -- Set the terminal for applications that require it
 do --gets the resolution and centers the menubar on the screen
  local handler = io.popen("xdpyinfo | awk '/dimensions/{print $2}'")
  if handler then
    local resolution = handler:read("*a")
    handler:close()
    local t={}
    for str in string.gmatch(resolution, "([^x]+)") do
      table.insert(t, tonumber(str))
      --naughty.notify({text=str})
    end
    menubar.geometry.x = t[1]/4
    menubar.geometry.y = t[2]/4
    menubar.geometry.width = t[1]/2
  end
 end