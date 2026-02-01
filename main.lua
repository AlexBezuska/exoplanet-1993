lg = love.graphics
random = love.math.random
lg.setDefaultFilter("nearest", "nearest")
Gamestate = require "libs.gamestate"
require "libs.simpleScale"
vector = require 'libs.vector'
width = 800
height = 600
windowWidth = 800
windowHeight = 600
local sign = {1,-1}


desktopPurple = {130/255,53/255,109/255}

require "titlescreen"
require "desk"
require "computer"
require "email"
require "archive"
require "telescope"

CelestialBody = require "celestial_body"
Starfield = require "starfield"
visibleObjects = {}
local star
local planet
local planet2
local starbg

simulationSpeedMultiplier = 0.05
Starfield_bg = Starfield

function init()
  simpleScale.setWindow(width,height,windowWidth,widthHeight, {fullscreen = fullscreen, resizable = true});  
<<<<<<< Updated upstream
  star = CelestialBody(Vector(windowWidth/2,widthHeight/2),250,{1.0,0.8,0.2})
  planet = CelestialBody(Vector(0,widthHeight/2),5,{0,0,0.08})
  planet2 = CelestialBody(Vector(0,widthHeight/2),5,{0,0,0.08})
  starbg = Starfield(0.5,windowWidth,widthHeight,1)
=======
  star = CelestialBody({windowWidth/2,windowHeight/2,0,0},250,0,{1,1,1})
  --planet = CelestialBody(,5,{0,0,0})
  --planet2 = CelestialBody(Vector(0,widthHeight/2),5,{0,0,0})
  planet = generateCelestialBody()
  starbg = Starfield(0.5,windowWidth,windowHeight,1)
>>>>>>> Stashed changes
  table.insert(visibleObjects,starbg)
  table.insert(visibleObjects,star)
  table.insert(visibleObjects,planet)
end

function generateCelestialBody()
  local dir = sign[random(1,2)]
  local randomRadX = random(125)
  local randomRadY = random(125)
  local mx = 400+(math.sqrt(random(15625))*dir)
  local my = 300+(math.sqrt(random(15625))*dir)
  print (mx, my)
  local sx = mx+(random(1000)-100)
  local sy = my+(random(800)-100)
  print(sx,sy)
  local rise, run = 0,0
  local dx,dy,ex,ey = 0,0,0,0
  
  if (CheckCollisionPoint(sx,sy,0,0,windowWidth,windowHeight)) then
     if mx > sx then
       ex = mx+(mx-sx)
     else
       ex = mx+(sx-mx)
     end
     if my > sy then
       ey = my+(my-sy)
     else
       ey = my+(sy-my)
     end
  else
    sy = sy+600
    if mx > sx then
       ex = mx+(mx-sx)
     else
       ex = mx+(sx-mx)
     end
     if my > sy then
       ey = my+(my-sy)
     else
       ey = my+(sy-my)
    end
  end
  print(sx,sy)
  print(dx,dy)
  print(ex, ey)
  
  --local randomAngle = love.math.random()*(2*math.pi)
  --local pos = {x = (windowWidth/2) + (500 * math.cos(randomAngle)), y = (windowHeight/2) + (500 * math.sin(randomAngle))}
  local pos = {sx,sy,ex,ey}
  local rad = 5
  local speed = love.math.random(100)
  local color = {0,0,0}
  return CelestialBody(pos,rad,speed,color)
end
  
function CheckCollisionPoint(x1,y1,x2,y2,w,h)
  return x1 < x2+w and
         x2 < x1 and
         y1 < y2+h and
         y2 < y1
end

function love.load()
  init()
  Gamestate.registerEvents()
<<<<<<< Updated upstream
  Gamestate.switch(titlescreen)
=======
  Gamestate.switch(telescope)
>>>>>>> Stashed changes
end

function love.update(dt)
  simpleScale.resizeUpdate()
  CelestialBodyMovements(dt)
  
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end

end

function love.resize()
  lg.setColor({0,0,0})
  lg.rectangle( "fill", 0, 0, windowWidth, widthHeight)
end

function CelestialBodyMovements(dt)
<<<<<<< Updated upstream
  planet:transit(Vector(windowWidth, 245) ,400, dt * simulationSpeedMultiplier)
  planet2:transit(Vector(windowWidth,-15),460,dt * simulationSpeedMultiplier)
=======
  planet:transit(dt)
  --planet2:transit(Vector(windowWidth,-15),-0.4,dt * simulationSpeedMultiplier)
>>>>>>> Stashed changes
end


function love.draw()
end

function love.keypressed(key)
  if key == "1" or key == "return" then
    Gamestate.switch(desk)
  elseif key == "2" then
    Gamestate.switch(computer)
  elseif key == "3" then
    Gamestate.switch(email)
  elseif key == "4" then
    Gamestate.switch(telescope)
  elseif key == "5" then
    Gamestate.switch(archive)
  elseif key == "home" then
    Gamestate.switch(titlescreen)
  end
end
