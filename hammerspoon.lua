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

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
  music("play")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
  music("back")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  music("forward")
end)

------------
-- ARROWS --
------------

local goLeft = function()
  hs.eventtap.keyStroke({}, "LEFT", 0)
end
local goDown = function()
  hs.eventtap.keyStroke({}, "DOWN", 0)
end
local goUp = function()
  hs.eventtap.keyStroke({}, "UP", 0)
end
local goRight = function()
  hs.eventtap.keyStroke({}, "RIGHT", 0)
end

hs.hotkey.bind({"ctrl"}, "H", goLeft,  nil, goLeft)
hs.hotkey.bind({"ctrl"}, "J", goDown,  nil, goDown)
hs.hotkey.bind({"ctrl"}, "K", goUp,    nil, goUp)
hs.hotkey.bind({"ctrl"}, "L", goRight, nil, goRight)

-----------
-- MOUSE --
-----------

local move = function(x, y)
  local pos = hs.mouse.getAbsolutePosition()
  hs.mouse.setAbsolutePosition({x = pos.x + x, y = pos.y + y})
end

local moveLeft = function()
  move(-20, 0)
end
local moveDown = function()
  move(0, 20)
end
local moveUp = function()
  move(0, -20)
end
local moveRight = function()
  move(20, 0)
end

hs.hotkey.bind({"ctrl", "alt"}, "H", moveLeft, nil, moveLeft)
hs.hotkey.bind({"ctrl", "alt"}, "J", moveDown, nil, moveDown)
hs.hotkey.bind({"ctrl", "alt"}, "K", moveUp,   nil, moveUp)
hs.hotkey.bind({"ctrl", "alt"}, "L", moveRight, nil, moveRight)

hs.hotkey.bind({"ctrl", "alt"}, "U", function()
  local pos = hs.mouse.getAbsolutePosition()
  hs.eventtap.leftClick(pos)
end)
hs.hotkey.bind({"ctrl", "alt"}, "I", function()
  local pos = hs.mouse.getAbsolutePosition()
  hs.eventtap.rightClick(pos)
end)

-- Replace alfred?
-- fuzzy app finder
-- quit all apps(expect hs)
-- replace spectacle
