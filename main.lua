lg = love.graphics
lg.setDefaultFilter("nearest", "nearest")
require "libs.simpleScale"

width = 800
height = 600
windowWidth = 800
widthHeight = 600

function love.load()
  
  simpleScale.setWindow(width,height,windowWidth,widthHeight, {fullscreen = fullscreen, resizable = true});
end

function love.update(dt)
  simpleScale.resizeUpdate()
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

function love.draw()
  simpleScale.set()
  lg.setBackgroundColor(200,100,0)
	lg.print("Window: " .. lg.getWidth() .. "x" .. lg.getHeight(), 16, lg.getHeight() - 48)
	lg.print("FPS: " .. love.timer.getFPS(), 16, lg.getHeight() - 28)
  simpleScale.unSet()
end

function love.keypressed(key)
end
