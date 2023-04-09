local awful = require("awful")

--to reboot processes
--os.execute("xautolock -exit") -- necessary evil, doesn't work
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
if handle then
    local pid = handle:read("*a")
    if not pid or pid == '' then
        awful.spawn("kitty /home/nanako/discordiabot.sh")
    end
end