-- main.lua
-- Minimal LÖVE 2D stub project.

local Game = require("src.app")

local gameState

local App = {
	w = 960,
	h = 540,
	scale = 1,
	bg = { 0.07, 0.07, 0.09, 1.0 },
	fg = { 0.92, 0.92, 0.96, 1.0 },
	accent = { 0.35, 0.75, 1.00, 1.0 },
	debug = true,
}

local function clamp(x, lo, hi)
	if x < lo then return lo end
	if x > hi then return hi end
	return x
end

local function get_dt_s(dt)
	-- Protect against huge dt spikes (tab out, debugger stop, etc.)
	return clamp(dt, 0, 1 / 15)
end

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setMode(App.w, App.h, {
		resizable = true,
		minwidth = 480,
		minheight = 270,
		highdpi = true,
	})
	love.window.setTitle("exoplanet-1993")

	gameState = Game.new()
end

function love.update(dt)
	dt = get_dt_s(dt)
	Game.update(gameState, dt)

	-- Example: hold Escape to quit
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

local function draw_centered_text(text, y)
	local font = love.graphics.getFont()
	local w = love.graphics.getWidth()
	local tw = font:getWidth(text)
	love.graphics.print(text, math.floor((w - tw) / 2), y)
end

function love.draw()
	love.graphics.clear(App.bg)
	love.graphics.setColor(App.fg)

	draw_centered_text("EXOPLANET 1993", 40)
	love.graphics.setColor(App.accent)
	draw_centered_text("Press ESC to quit", 70)

	Game.draw(gameState)

	love.graphics.setColor(App.fg)
	love.graphics.print("Window: " .. love.graphics.getWidth() .. "x" .. love.graphics.getHeight(), 16, love.graphics.getHeight() - 48)
	love.graphics.print("FPS: " .. love.timer.getFPS(), 16, love.graphics.getHeight() - 28)
end

function love.keypressed(key)
	if key == "f1" then
		App.debug = not App.debug
	end
end
