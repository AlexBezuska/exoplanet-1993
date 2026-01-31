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
	love.graphics.print("Window: " .. love.graphics.getWidth() .. "x" .. love.graphics.getHeight(), 16, love.graphics.getHeight() - 48)
	love.graphics.print("FPS: " .. love.timer.getFPS(), 16, love.graphics.getHeight() - 28)
end

function love.keypressed(key)
end
