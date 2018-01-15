-- A - ads
-- B,N,M - music
-- hjkl - move
-- ; arrow toggle
-- z reload
----------------
-- Key Modals --
----------------
-- mapped to right-cmd
local command_mode = hs.hotkey.modal.new({}, "f20")
local command_menu = hs.menubar.new()
local command_mode_on

function command_mode:entered()
  command_menu:setTitle("🌝")
  command_mode_on = true
end

function command_mode:exited()
  command_menu:setTitle("🌚")
  command_mode_on = false
end

for _, key in ipairs({"escape", "f20"}) do
  command_mode:bind({}, key, function() command_mode:exit() end)
end

command_menu:setClickCallback(function()
  if command_mode_on then
    command_mode:exit()
  else
    command_mode:enter()
  end
end)

local normal_mode = hs.hotkey.modal.new()
local normal_menu = hs.menubar.new()
local normal_mode_on

function normal_mode:entered()
  normal_menu:setTitle("⬆️")
  normal_mode_on = true
end

function normal_mode:exited()
  normal_menu:setTitle("⬇️")
  normal_mode_on = false
end

local function toggle_normal_mode()
  if normal_mode_on then
    normal_mode:exit()
  else
    normal_mode:enter()
  end
end

command_mode:bind({}, ";", toggle_normal_mode)
normal_menu:setClickCallback(toggle_normal_mode)

---------------
-- DOCK ICON --
---------------
hs.dockicon.hide()

command_mode:bind({}, "D", function()
  if hs.dockicon.visible() then
    hs.dockicon.hide()
  else
    hs.dockicon.show()
  end
end)

-------------------
-- CONFIG RELOAD --
-------------------
command_mode:bind({}, "Z", function()
  command_menu:setTitle("💀")
  hs.reload()
end)

-----------
-- MUSIC --
-----------
local cmus = {
  isRunning = function()
    local _, running = hs.execute('/usr/local/bin/cmus-remote -Q')
    return running
  end,
  playpause = function()
    hs.execute('/usr/local/bin/cmus-remote -u')
  end,
  previous = function()
    hs.execute('/usr/local/bin/cmus-remote -r')
  end,
  next = function()
    hs.execute('/usr/local/bin/cmus-remote -n')
  end,
}

local function music(action)
  local m
  if cmus.isRunning() then
    m = cmus
  elseif hs.itunes.isRunning() then
    m = hs.itunes
  elseif hs.spotify.isRunning() then
    m = hs.spotify
  else
    hs.alert.show("No Music Apps Running")
    return
  end

  if action == "play" then m.playpause()
  elseif action == "back" then m.previous()
  elseif action == "forward" then m.next()
  end
end

local musicControls = {B = "back", N = "play", M = "forward"}
for key, action in pairs(musicControls) do
  command_mode:bind({}, key, hs.fnutils.partial(music, action))
end

-----------------
-- Spotify ads --
-----------------
command_mode:bind({}, "A", function()
  if not hs.spotify.isRunning() then
    return
  end
  local checkAds
  checkAds = function()
    if hs.spotify.getCurrentArtist() == "" or not hs.spotify.getCurrentArtist() then
      hs.timer.doAfter(0.25, checkAds)
    else
      hs.spotify.setVolume(100)
    end
  end

  hs.spotify.setVolume(0)
  checkAds()
end)

-------------
--- ARROWS --
-------------
local pressArrow = function(direction)
  hs.eventtap.keyStroke({}, direction, 0)
end

local arrowControls = {H = "LEFT", J = "DOWN", K = "UP", L = "RIGHT"}
for key, direction in pairs(arrowControls) do
  local move = hs.fnutils.partial(pressArrow, direction)
  normal_mode:bind({"ctrl"}, key, move, nil, move)
end

-----------
-- CHUNK --
-----------
normal_mode:bind({"alt"}, "K", function()
  local window = hs.window.focusedWindow()
  window:maximize()
end)

normal_mode:bind({"alt"}, "H", function()
  local window = hs.window.focusedWindow()
  window:move(hs.layout.left50)
end)

normal_mode:bind({"alt"}, "L", function()
  local window = hs.window.focusedWindow()
  window:move(hs.layout.right50)
end)

normal_mode:bind({"ctrl", "alt"}, "H", function()
  local window = hs.window.focusedWindow()
  window:moveOneScreenWest()
end)

normal_mode:bind({"ctrl", "alt"}, "L", function()
  local window = hs.window.focusedWindow()
  window:moveOneScreenEast()
end)

----------
-- MISC --
----------
hs.window.animationDuration = 0
normal_mode:enter()
command_mode:exit()

-- Replace alfred?
-- fuzzy app finder
-- quit all apps(expect hs)
-- replace flycut?
-- mouse scroll?
