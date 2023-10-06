local awful = require("awful")

--to reboot processes
awful.spawn("killall picom")
awful.spawn("killall nm-applet")

--network gadget
awful.spawn("nm-applet")

--keyboard
awful.spawn("fcitx5")

--screen locker
--everything related to X seems to suck
--awful.spawn("xscreensaver --no-splash")
--awful.spawn("xautolock -corners +00- -time 5 -locker 'xscreensaver-command -lock'")
awful.spawn("xautolock -corners +00- -time 5 -locker slock")

--compositor
awful.spawn("picom --vsync")
