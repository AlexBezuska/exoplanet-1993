computer = {}

function computer:init()
   bezel = lg.newImage("images/screen-bezel.png")
end

function computer:enter()
  
end

function computer:update(dt)
end

function computer:draw()
  simpleScale.set()
  lg.setColor(1,1,1)
 
  lg.setColor(desktopPurple)
  lg.rectangle( "fill", 0, 0, windowWidth, widthHeight)

  lg.setColor(1,1,1)
  lg.draw( bezel, 0,0)

--  This is the screen space we have to work with
  screenSpace = {0.5,0.5,0.5}
  lg.setColor(screenSpace)
  lg.rectangle( "line", 80, 60, 640, 465)

  lg.setColor(1,1,1)
  lg.print("I am computer",90,90)

  simpleScale.unSet()
end

function computer:leave()
end

return computer
