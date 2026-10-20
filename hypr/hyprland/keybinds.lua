local mainMod    = "SUPER"
local scriptsDir = "scripts"
local ipc        = "noctalia msg"

-- Apps
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("vesktop"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("chatterino2"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("feishin"))

-- Noctalia shell controls
-- Core Functions
hl.bind(mainMod .. "+A", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind(mainMod .. "+S", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind(mainMod .. "+comma", hl.dsp.exec_cmd(ipc .. " settings-toggle"))

-- Panels
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(ipc .. " panel-toggle session"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(ipc .. " lockScreen lock"))
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd(ipc .. " systemMonitor toggle"))

-- Wallpaper
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(ipc .. " panel-toggle wallpaper"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(ipc .. " wallpaper-random"))

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume-mute"))

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(ipc .. " media toggle"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(ipc .. " media next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(ipc .. " media previous"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd(ipc .. " media stop"))

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness-down"))

-- Screenshots
hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd(ipc .. " screenshot-region"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(ipc .. " screenshot-fullscreen"))

-- Hyprland
-- Window Adjustment
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), { description = "fullscreen" })
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = 1 }), { description = "maximize window" })
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }), { description = "float current window" })

-- Desktop Zooming
hl.bind(mainMod .. " + ALT + mouse_down", hl.dsp.exec_cmd(
    [[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')" ]]
), { mouse = true, description = "zoom in" })
hl.bind(mainMod .. " + ALT + mouse_up", hl.dsp.exec_cmd(
    [[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')" ]]
), { mouse = true, description = "zoom out" })

-- System
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("hyprctl dispatch exit 0"), { description = "exit Hyprland" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "close active window" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(scriptsDir .. "/KillActiveProcess.sh"),
    { description = "terminate active process" })

-- Cycle windows
hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- Resize Windows
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -50, y = 0 }),
    { repeating = true, description = "resize left" })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 50, y = 0 }),
    { repeating = true, description = "resize right" })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -50 }),
    { repeating = true, description = "resize up" })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 50 }),
    { repeating = true, description = "resize down" })
-- Move/Resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "move window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "resize window" })

-- Move Windows
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.move({ direction = "l" }), { description = "move window left" })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "r" }), { description = "move window right" })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.move({ direction = "u" }), { description = "move window up" })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.move({ direction = "d" }), { description = "move window down" })

-- Swap Windows
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.swap({ direction = "l" }), { description = "swap window left" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.swap({ direction = "r" }), { description = "swap window right" })
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.swap({ direction = "u" }), { description = "swap window up" })
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.swap({ direction = "d" }), { description = "swap window down" })

-- Move Focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }), { description = "focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }), { description = "focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }), { description = "focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }), { description = "focus down" })

-- Workspace Navigation
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "m+1" }), { description = "next workspace" })
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "m-1" }), { description = "previous workspace" })

-- Special Workspace
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "special" }),
    { description = "move to special workspace" })
hl.bind(mainMod .. " + U", hl.dsp.workspace.toggle_special(), { description = "toggle special workspace" })

-- Switch Workspaces (keycodes for layout-independence)
for i = 1, 10 do
    local key = "code:" .. (9 + i) -- code:10 = 1 … code:19 = 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "workspace " .. i })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }),
        { description = "move to workspace " .. i })
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i, silent = true }),
        { description = "move silently to workspace " .. i })
end
