lg = love.graphics
lg.setDefaultFilter("nearest", "nearest")
require "libs.simpleScale"
require "celestial_body"
require "starfield"


width = 800
height = 600
windowWidth = 800
widthHeight = 600
simulationSpeedMultiplier = 0.05
Starfield_bg = Starfield

function love.load()
  Star = celestial_body(windowWidth/2,widthHeight/2,250)
  Planet = celestial_body(0,widthHeight/2,5)
  Starfield_bg = Starfield(0.5,windowWidth,widthHeight,1)
  simpleScale.setWindow(width,height,windowWidth,widthHeight, {fullscreen = fullscreen, resizable = true});
 
  
end

function love.update(dt)
 
  simpleScale.resizeUpdate()
  Planet:transit(windowWidth, math.sin(love.timer.getTime()) * 1.2 * dt,45, dt * simulationSpeedMultiplier)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end

end

function love.draw()
  lg.setBackgroundColor(0,0,0.08)
  simpleScale.set()
  Starfield_bg:draw(lg)
  Star:draw(lg,250,250,250,250)
  Planet:draw(lg,0,0,0,250)
 
 
	lg.print("Window: " .. lg.getWidth() .. "x" .. lg.getHeight(), 16, lg.getHeight() - 48)
	lg.print("FPS: " .. love.timer.getFPS(), 16, lg.getHeight() - 28)
  simpleScale.unSet()
end

function love.keypressed(key)
end
