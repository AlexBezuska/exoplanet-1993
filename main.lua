lg = love.graphics
lg.setDefaultFilter("nearest", "nearest")

function love.load()
end

function love.update(dt)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

function love.draw()
  lg.setBackgroundColor(200,100,0)
	lg.print("Window: " .. lg.getWidth() .. "x" .. lg.getHeight(), 16, lg.getHeight() - 48)
	lg.print("FPS: " .. love.timer.getFPS(), 16, lg.getHeight() - 28)
end

function love.keypressed(key)
end
