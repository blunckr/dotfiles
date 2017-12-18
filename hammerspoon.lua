-- A - ads
-- B,N,M - music
-- hjkl - chunk
-- ; arrow toggle
-- z reload
-- iop - bsp, monocle, float
---------------
-- Key Modal --
---------------
local k = hs.hotkey.modal.new({}, "f20")
local kMenu = hs.menubar.new()
local kOn

function k:entered()
  kMenu:setTitle("🌝")
  kOn = true
end

function k:exited()
  kMenu:setTitle("🌚")
  kOn = false
end

k:bind({}, "escape", function() k:exit() end)
k:exit() -- just to trigger the icon

kMenu:setClickCallback(function()
  if kOn then
    k:exit()
  else
    k:enter()
  end
end)

---------------
-- DOCK ICON --
---------------
hs.dockicon.hide()

k:bind({}, "D", function()
  if hs.dockicon.visible() then
    hs.dockicon.hide()
  else
    hs.dockicon.show()
  end
end)

-------------------
-- CONFIG RELOAD --
-------------------
hs.alert("Config Reloaded")
k:bind({}, "Z", function()
  kMenu:setTitle("💀")
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
  k:bind({}, key, hs.fnutils.partial(music, action))
end

-----------------
-- Spotify ads --
-----------------

k:bind({}, "A", function()
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
local arrows = hs.hotkey.modal.new()
local arrowMenu = hs.menubar.new()
local arrowsOn

function arrows:entered()
  arrowMenu:setTitle("⬆️")
  arrowsOn = true
end

function arrows:exited()
  arrowMenu:setTitle("⬇️")
  arrowsOn = false
end

local function toggleArrows()
  if arrowsOn then
    arrows:exit()
  else
    arrows:enter()
  end
end

k:bind({}, ";", toggleArrows)
arrowMenu:setClickCallback(toggleArrows)

local pressArrow = function(direction)
  hs.eventtap.keyStroke({}, direction, 0)
end

local arrowControls = {H = "LEFT", J = "DOWN", K = "UP", L = "RIGHT"}
for key, direction in pairs(arrowControls) do
  local move = hs.fnutils.partial(pressArrow, direction)
  arrows:bind({"ctrl"}, key, move, nil, move)
end
arrows:enter()

-----------
-- MOUSE --
-----------
local mouseAcc = 1

local move = function(x, y)
  local pos = hs.mouse.getAbsolutePosition()
  hs.mouse.setAbsolutePosition({x = pos.x + x, y = pos.y + y})
  mouseAcc = mouseAcc * 1.1
end

local moveLeft = function()
  move(-20 * mouseAcc, 0)
end
local moveDown = function()
  move(0, 20 * mouseAcc)
end
local moveUp = function()
  move(0, -20 * mouseAcc)
end
local moveRight = function()
  move(20 * mouseAcc, 0)
end

local stop = function()
  mouseAcc = 1
end

k:bind({"ctrl", "alt"}, "H", moveLeft,  stop, moveLeft)
k:bind({"ctrl", "alt"}, "J", moveDown,  stop, moveDown)
k:bind({"ctrl", "alt"}, "K", moveUp,    stop, moveUp)
k:bind({"ctrl", "alt"}, "L", moveRight, stop, moveRight)

k:bind({"ctrl", "alt"}, "U", function()
  local pos = hs.mouse.getAbsolutePosition()
  hs.eventtap.leftClick(pos)
end)
k:bind({"ctrl", "alt"}, "I", function()
  local pos = hs.mouse.getAbsolutePosition()
  hs.eventtap.rightClick(pos)
end)

---------------
-- Spectacle --
---------------
-- k:bind({}, "F", function()
--   local window = hs.window.focusedWindow()
--   window:maximize()
-- end)
-- 
-- k:bind({}, "H", function()
--   local window = hs.window.focusedWindow()
--   window:move(hs.layout.left50)
-- end)
-- 
-- k:bind({}, "L", function()
--   local window = hs.window.focusedWindow()
--   window:move(hs.layout.right50)
-- end)
-- 
-- k:bind({"shift"}, "H", function()
--   local window = hs.window.focusedWindow()
--   window:moveOneScreenWest()
-- end)
-- 
-- k:bind({"shift"}, "L", function()
--   local window = hs.window.focusedWindow()
--   window:moveOneScreenEast()
-- end)

k:bind({}, "h", function()
  hs.execute('/usr/local/bin/chunkc tiling::window --focus west')
end)
k:bind({}, "j", function()
  hs.execute('/usr/local/bin/chunkc tiling::window --focus south')
end)
k:bind({}, "k", function()
  hs.execute('/usr/local/bin/chunkc tiling::window --focus north')
end)
k:bind({}, "l", function() hs.execute('/usr/local/bin/chunkc tiling::window --focus east')
end)

k:bind({"ctrl"}, "h", function()
  hs.execute('/usr/local/bin/chunkc tiling::window --swap west')
end)
k:bind({"ctrl"}, "j", function()
  hs.execute('/usr/local/bin/chunkc tiling::window --swap south')
end)
k:bind({"ctrl"}, "k", function()
  hs.execute('/usr/local/bin/chunkc tiling::window --swap north')
end)
k:bind({"ctrl"}, "l", function()
  hs.execute('/usr/local/bin/chunkc tiling::window --swap east')
end)

k:bind({"shift"}, "h", function()
  hs.execute('/usr/local/bin/chunkc tiling::monitor -f prev')
end)
k:bind({"shift"}, "l", function()
  hs.execute('/usr/local/bin/chunkc tiling::monitor -f next')
end)

k:bind({"shift", "ctrl"}, "h", function()
  hs.execute('/usr/local/bin/chunkc tiling::window --send-to-monitor prev; /usr/local/bin/chunkc tiling::monitor -f prev')
end)
k:bind({"shift", "ctrl"}, "l", function()
  hs.execute('/usr/local/bin/chunkc tiling::window --send-to-monitor next; /usr/local/bin/chunkc tiling::monitor -f next')
end)

-- don't think I want this
-- k:bind({"ctrl", "alt"}, "h", function()
--   hs.execute('/usr/local/bin/chunkc tiling::window --warp west')
-- end)
-- k:bind({"ctrl", "alt"}, "j", function()
--   hs.execute('/usr/local/bin/chunkc tiling::window --warp south')
-- end)
-- k:bind({"ctrl", "alt"}, "k", function()
--   hs.execute('/usr/local/bin/chunkc tiling::window --warp north')
-- end)
-- k:bind({"ctrl", "alt"}, "l", function()
--   hs.execute('/usr/local/bin/chunkc tiling::window --warp east')
-- end)

k:bind({}, "u", function()
  hs.execute('/usr/local/bin/chunkc tiling::desktop --rotate 270')
end)
k:bind({"shift"}, "u", function()
  hs.execute('/usr/local/bin/chunkc tiling::desktop --rotate 90')
end)
k:bind({}, "i", function()
  hs.execute('/usr/local/bin/chunkc tiling::desktop --layout bsp')
end)
k:bind({}, "o", function()
  hs.execute('/usr/local/bin/chunkc tiling::desktop --layout monocle')
end)
k:bind({}, "p", function()
  hs.execute('/usr/local/bin/chunkc tiling::desktop --layout float')
end)

----------
-- MISC --
----------

-- Replace alfred?
-- fuzzy app finder
-- quit all apps(expect hs)
-- replace flycut?
-- mouse scroll?
