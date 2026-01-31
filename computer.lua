computer = {}

function computer:init()
end

function computer:enter()
  
end

function computer:update(dt)
end

function computer:draw()
  simpleScale.set()
  lg.setColor(1,1,1)
  lg.print("computer",100,100)
  simpleScale.unSet()
end

function computer:leave()
end

return computer
