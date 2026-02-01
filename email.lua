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
  --email window bar 
  lg.setColor(0.05, 0.2, 0.8)
  lg.rectangle("fill", 180, 60, 530, 30)
  --email window close button
  lg.setColor(0.8, 0.05, 0.2)
  lg.rectangle("fill",682, 62, 25, 25)
  --email window body
  lg.setColor(1,1,1)
  lg.rectangle("fill", 180, 90, 530, 430)

  simpleScale.unSet()
end

function email:leave()
end

return email