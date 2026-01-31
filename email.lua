email = {}

function email:init()

end

function email:enter()
  
end

function email:update(dt)
end

function email:draw()
  simpleScale.set()
  lg.setColor(1,1,1)
  lg.print("email",100,100)
  simpleScale.unSet()
end

function email:leave()
end

return email