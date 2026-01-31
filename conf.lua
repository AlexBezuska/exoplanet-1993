io.stdout:setvbuf('no')

function love.conf(t)
	t.identity = "exoplanet-1993"
	t.version = "11.5"
	t.console = false

	t.window.title = "exoplanet-1993"
	t.window.width = 800
	t.window.height = 600
	t.window.resizable = false
  t.window.fullscreen = false
	t.window.vsync = 1
end
