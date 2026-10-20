hl.monitor({
    output   = "DP-2",
    mode     = "2560x1440@144",
    position = "1920x0",
    scale    = "auto",
})

hl.monitor({
    output = "DVI-I-1",
    mode = "1920x1080@144",
    position = "0x0",
    scale = 1,
})

-- AUTOSTART
hl.on("hyprland.start", function()
    hl.dispatch(hl.dsp.focus({ monitor = "DP-2" }))
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("vesktop")
    hl.exec_cmd("mpris-proxy")
    hl.exec_cmd("trash-empty 30")
    hl.exec_cmd("mullvad-vpn")
end)

require("hyprland/env")
require("hyprland/look_feel")
require("hyprland/general")
require("hyprland/keybinds")
require("hyprland/rules")

-- For Noctalia Color templates
require("noctalia")
