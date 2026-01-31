-- src/app.lua
-- Put your game/app state here.

local App = {}

function App.new()
	return {
		t = 0,
	}
end

function App.update(state, dt)
	state.t = state.t + dt
end

function App.draw(state)
	-- no-op for now
end

return App
