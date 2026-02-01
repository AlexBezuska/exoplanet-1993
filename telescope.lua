telescope = {}
telescopeTimestampFont = lg.newFont("fonts/FiraCode-Regular.ttf", 24)
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
  lg.setBackgroundColor(0,0,0)
  starbg:draw()
  for _,obj in ipairs(visibleObjects) do
    obj:draw()
  end
  lg.setFont(telescopeTimestampFont)
  date1993 = os.date("1993/%m/%d")
  time1993 = os.date("%H:%M:%S")
  drawPaddedLabel(date1993 .. "\n" .. time1993, 650, 0, 21, 50, {bgColor={0/255,56/255,255/255}, textColor={1,1,1}})

  lg.setColor(1,1,1)
  lg.draw(bezel,0,0)
  lg.setFont(defaultFont)
  simpleScale.unSet()
end

function telescope:leave()
  
end

return telescope
