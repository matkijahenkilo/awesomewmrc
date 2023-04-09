local awful = require("awful")

local processesToKill = {
  "luvit",
  "discordiabot",
}

local function killProcesses()
  for _, process in ipairs(processesToKill) do
    local handle = io.popen("pgrep " .. process)
    if handle then
      local pid = handle:read("*a")
      handle:close()
      awful.spawn("kill " .. pid)
    end
  end
end

--stop stuff
do
  killProcesses()
  awful.spawn("xautolock -exit")
  awful.spawn("xautolock -exit")
  awful.spawn("killall picom")
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
