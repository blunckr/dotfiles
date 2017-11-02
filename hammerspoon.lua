hs.window.animationDuration = 0

-- Put hotkeys on this modal so they can be disabled if needed
local k = hs.hotkey.modal.new({"ctrl", "alt", "cmd"}, "Q", "hotkeys enabled")
k:bind({"ctrl", "alt", "cmd"}, "Q", "hotkeys disbled", function() k:exit() end)

-------------------
-- CONFIG RELOAD --
-------------------

hs.alert("Config Reloaded")
k:bind({"cmd", "alt", "ctrl"}, "Z", hs.reload)

-----------
-- MUSIC --
-----------

local function music(action)
  local m
  if hs.itunes.isRunning() then
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

local musicControls = {J = "back", K = "play", L = "forward"}
for key, action in pairs(musicControls) do
  k:bind({"cmd", "alt", "ctrl", "shift"}, key, hs.fnutils.partial(music, action))
end

-----------------
-- Spotify ads --
-----------------

k:bind({"cmd", "alt", "ctrl"}, "A", function()
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

------------
-- ARROWS --
------------

local arrow = function(direction)
  hs.eventtap.keyStroke({}, direction, 0)
end

local arrowControls = {H = "LEFT", J = "DOWN", K = "UP", L = "RIGHT"}
for key, direction in pairs(arrowControls) do
  local move = hs.fnutils.partial(arrow, direction)
  k:bind({"ctrl"}, key, move, nil, move)
end

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

k:bind({"alt", "cmd"}, "F", function()
  local window = hs.window.focusedWindow()
  window:maximize()
end)

k:bind({"alt", "cmd"}, "H", function()
  local window = hs.window.focusedWindow()
  window:move(hs.layout.left50)
end)

k:bind({"alt", "cmd"}, "L", function()
  local window = hs.window.focusedWindow()
  window:move(hs.layout.right50)
end)

k:bind({"ctrl", "alt", "cmd"}, "H", function()
  local window = hs.window.focusedWindow()
  window:moveOneScreenWest()
end)

k:bind({"ctrl", "alt", "cmd"}, "L", function()
  local window = hs.window.focusedWindow()
  window:moveOneScreenEast()
end)
-- Replace alfred?
-- fuzzy app finder
-- quit all apps(expect hs)
-- replace flycut?
-- mouse scroll?
k:enter()
