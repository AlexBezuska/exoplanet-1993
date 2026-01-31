desk = {}

function desk:init()
end

function desk:enter()
  
end

function desk:update(dt)
end

function desk:draw()
  simpleScale.set()
  lg.setColor(1,1,1)
  lg.print("desk",100,100)
  simpleScale.unSet()
end

function desk:leave()
end

return desk
