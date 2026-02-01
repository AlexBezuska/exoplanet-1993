lg = love.graphics
lg.setDefaultFilter("nearest", "nearest")
Gamestate = require "libs.gamestate"
require "libs.simpleScale"
Vector = require 'libs.vector'
width = 800
height = 600
windowWidth = 800
widthHeight = 600

desktopPurple = {130/255,53/255,109/255}

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
  star = CelestialBody(Vector(windowWidth/2,widthHeight/2),250,{1,1,1})
  planet = CelestialBody(Vector(0,widthHeight/2),5,{0,0,0})
  planet2 = CelestialBody(Vector(0,widthHeight/2),5,{0,0,0})
  starbg = Starfield(0.5,windowWidth,widthHeight,1)
  table.insert(visibleObjects,starbg)
  table.insert(visibleObjects,star)
  table.insert(visibleObjects,planet)
  table.insert(visibleObjects,planet2)
end

function love.load()
  init()
  Gamestate.registerEvents()
  Gamestate.switch(desk)
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
  planet:transit(Vector(windowWidth, 245) ,-1, dt * simulationSpeedMultiplier)
  planet2:transit(Vector(windowWidth,-15),-0.4,dt * simulationSpeedMultiplier)
end


function love.draw()
end

function love.keypressed(key)
  if key == "1" then
    Gamestate.switch(desk)
  elseif key == "2" then
    Gamestate.switch(computer)
  elseif key == "3" then
    Gamestate.switch(email)
  elseif key == "4" then
    Gamestate.switch(telescope)
  elseif key == "5" then
    Gamestate.switch(archive)
  end
end
