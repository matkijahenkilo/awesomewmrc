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
--everything related to X seems to suck
--awful.spawn("xscreensaver --no-splash")
--awful.spawn("xautolock -corners +00- -time 5 -locker 'xscreensaver-command -lock'")
awful.spawn("xautolock -corners +00- -time 5 -locker slock")

--compositor
awful.spawn("picom --vsync")

--discord bot w
do
  local handler = io.popen("pgrep luvit")
  if handler then
    local pid = handler:read("*a")
    handler:close()
    if not pid or pid == '' then
      awful.spawn("kitty /home/nanako/discordiabot.sh")
    end
  end
end
