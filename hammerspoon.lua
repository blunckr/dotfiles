hs.window.animationDuration = 0
-------------------
-- CONFIG RELOAD --
-------------------

hs.alert("Config Reloaded")
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Z", hs.reload)

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
  hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, key, hs.fnutils.partial(music, action))
end

-----------------
-- Spotify ads --
-----------------

local spotifyAds = false

hs.timer.doEvery(5, function()
  if hs.spotify.isRunning() then
    if hs.spotify.getCurrentArtist() == "" or not hs.spotify.getCurrentArtist() then
      if not spotifyAds then
        spotifyAds = true
        hs.alert.show("AD")
      end
      hs.spotify.setVolume(0)
    else
      if spotifyAds then
        spotifyAds = false
        hs.alert.show("MUSIC")
      end
      hs.spotify.setVolume(100)
    end
  end
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
  hs.hotkey.bind({"ctrl"}, key, move, nil, move)
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

hs.hotkey.bind({"ctrl", "alt"}, "H", moveLeft,  stop, moveLeft)
hs.hotkey.bind({"ctrl", "alt"}, "J", moveDown,  stop, moveDown)
hs.hotkey.bind({"ctrl", "alt"}, "K", moveUp,    stop, moveUp)
hs.hotkey.bind({"ctrl", "alt"}, "L", moveRight, stop, moveRight)

hs.hotkey.bind({"ctrl", "alt"}, "U", function()
  local pos = hs.mouse.getAbsolutePosition()
  hs.eventtap.leftClick(pos)
end)
hs.hotkey.bind({"ctrl", "alt"}, "I", function()
  local pos = hs.mouse.getAbsolutePosition()
  hs.eventtap.rightClick(pos)
end)

---------------
-- Spectacle --
---------------

hs.hotkey.bind({"alt", "cmd"}, "F", function()
  local window = hs.window.focusedWindow()
  window:maximize()
end)

hs.hotkey.bind({"alt", "cmd"}, "H", function()
  local window = hs.window.focusedWindow()
  window:move(hs.layout.left50)
end)

hs.hotkey.bind({"alt", "cmd"}, "L", function()
  local window = hs.window.focusedWindow()
  window:move(hs.layout.right50)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "H", function()
  local window = hs.window.focusedWindow()
  window:moveOneScreenWest()
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "L", function()
  local window = hs.window.focusedWindow()
  window:moveOneScreenEast()
end)
-- Replace alfred?
-- fuzzy app finder
-- quit all apps(expect hs)
-- replace flycut?
-- mouse scroll?
-- mute spotify ads. getCurrentArtist will be blank


