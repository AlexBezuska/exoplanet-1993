archive = {}

function archive:init()
end

function archive:enter()
  
end

function archive:update(dt)
end

function archive:draw()
  simpleScale.set()
  lg.setColor(1,1,1)
  lg.print("archive",100,100)
  simpleScale.unSet()
end

function archive:leave()
end

return archive