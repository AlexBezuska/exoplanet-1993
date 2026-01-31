telescope = {}

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
  for _,obj in ipairs(visibleObjects) do
    obj:draw()
  end
  simpleScale.unSet()
end

function telescope:leave()
  
end

return telescope
