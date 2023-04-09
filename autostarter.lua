local awful = require("awful")

awful.spawn("xautolock -exit")
awful.spawn("killall picom")
awful.spawn("killall nm-applet")

--network gadget
awful.spawn("nm-applet")

--keyboard
awful.spawn("fcitx5")

--screen locker
awful.spawn("xautolock -corners +00- -time 5 -locker slock")

--compositor
awful.spawn("picom --vsync")

--discord bot w
local handle = io.popen("pgrep luvit")
if not handle then awful.spawn("kitty /home/nanako/discordiabot.sh") end