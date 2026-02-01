telescope = {}

local bezel = lg.newImage("images/screen-bezel.png")

function telescope:init()
end

function telescope:enter()
  print ("entering telescope")
end

function telescope:update(dt)
end

function telescope:draw()
  simpleScale.set()
  lg.setBackgroundColor(0,0,0.08)
  starbg:draw()
  for _,obj in ipairs(visibleObjects) do
    obj:draw()
  end
  lg.setColor(1,1,1)
  lg.draw(bezel,0,0)
  simpleScale.unSet()
end

function telescope:leave()
  
end

return telescope
