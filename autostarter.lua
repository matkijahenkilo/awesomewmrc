local awful = require("awful")

--stop stuff
do
  awful.spawn("xautolock -exit")
  local handle = io.popen("pgrep discordiabot")
  if handle then
    local pid = handle:read("*a")
    handle:close()
    awful.spawn("kill " .. pid)
  end
  awful.spawn("killall picom")
  awful.spawn("xautolock -exit")
  awful.spawn("killall nm-applet")
end

--network gadget
awful.spawn("nm-applet")

--keyboard
awful.spawn("fcitx5")

--discord bot w
awful.spawn("kitty /home/nanako/discordiabot.sh")

--screen locker
awful.spawn("xautolock -corners +00- -time 5 -locker slock")

--compositor
awful.spawn("picom --vsync")
