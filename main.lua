lg = love.graphics

titleFont = lg.newFont("fonts/LCDM2U.TTF", 40)

defaultFont = lg.newFont("fonts/FiraCode-Regular.ttf", 12)
RotateByCenter = require "libs.rotateByCenter"
drawPaddedLabel = require "libs.paddedLabel"

ClickableObject = require "libs.clickableObject"

lg.setDefaultFilter("nearest", "nearest")
Gamestate = require "libs.gamestate"
require "libs.simpleScale"
Vector = require 'libs.vector'
width = 800
height = 600
windowWidth = 800
windowHeight = 600


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
transitObjectImages = {
  
  }

local star
local planet
local planet2


simulationSpeedMultiplier = 0.1
Starfield_bg = Starfield

function init()
  simpleScale.setWindow(width,height,windowWidth,windowHeight, {fullscreen = fullscreen, resizable = true});  
  star = CelestialBody(nil,Vector(windowWidth/2,windowHeight/2-12),Vector(0,0),50,0,{1.0,0.3,0.2})
  planet = CelestialBody(nil,Vector(0,windowHeight/2),Vector(windowWidth, 0),2,50,{0,0,0.08})
  starbg = Starfield(0.5,windowWidth,windowHeight,1)
  table.insert(visibleObjects,star)
  table.insert(visibleObjects,planet)
end

function love.load()
  init()
  Gamestate.registerEvents()
  Gamestate.switch(titlescreen)
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
  lg.rectangle( "fill", 0, 0, windowWidth, windowHeight)
end

function CelestialBodyMovements(dt)
  for _,obj in ipairs(visibleObjects) do
    obj:transit(dt*simulationSpeedMultiplier)
  end
  --planet:transit(Vector(windowWidth, windowHeight), dt * simulationSpeedMultiplier)
  --planet2:transit(Vector(windowWidth,-15),460,dt * simulationSpeedMultiplier)
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
  elseif key == "home" or "0" then
    Gamestate.switch(titlescreen)
  end
end
