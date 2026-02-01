computer = {}
require "libs.desktopIcon"
computerClockFont = lg.newFont("fonts/FiraCode-Regular.ttf", 15)

function computer:init()
  bezel = lg.newImage("images/screen-bezel.png")
  iconPhotosImage = lg.newImage("images/icon-photos.png")
  iconEmailImage = lg.newImage("images/icon-email.png")
  iconTelescopeImage = lg.newImage("images/icon-photos.png")
  iconTrashImage = lg.newImage("images/icon-trash.png")

  
  self.telescopeClick = ClickableObject(92 - 70, 300 - 70, 70 * 2, 70 * 2)
  self.photosClick = ClickableObject(88 - 70, 100 - 70, 70 * 2, 70 * 2)
  self.emailClick = ClickableObject(85 - 70, 200 - 70, 70 * 2, 70 * 2)
  self.trashClick = ClickableObject(102 - 70, 400 - 70, 70 * 2, 70 * 2)
  self.monitorToggle = ClickableObject(25, 500,70)
  Telescope = false
  Photos = false
  Email = false
  Trash = false
  Monitor = false

end

function computer:enter()

end

function computer:update(dt)
  date1993 = os.date("1993/%m/%d")
  time1993 = os.date("%H:%M:%S")
  local mousepointx = love.mouse.getX()
  local mousepointy = love.mouse.getY()
  
 if Monitor then
  Telescope = self.telescopeClick:update(mousepointx, mousepointy)
  Photos = self.photosClick:update(mousepointx, mousepointy)
  Email = self.emailClick:update(mousepointx, mousepointy)
  Trash = self.trashClick:update(mousepointx, mousepointy)
 end
  --icons now work
 
  if Telescope then
    Gamestate.switch(telescope)
  end
 
      if self.monitorToggle:update() then
         print("hello")
    if Monitor then
      Monitor = false
    
    elseif not Monitor then
      Monitor= true
  end
end
    

end

function computer:draw()
  simpleScale.set()
  lg.setColor(1, 1, 1)

  lg.setColor(desktopPurple)
  lg.rectangle("fill", 0, 0, windowWidth, windowHeight)


  lg.setColor({0.3, 0.3, 0.3})
  lg.rectangle("fill", 0, windowHeight - 100, windowWidth, 100)

  lg.setFont(computerClockFont)
  lg.setColor(1,1,1)
  lg.print(date1993 .. " " .. time1993,windowWidth - 260,windowHeight - 90)
  lg.setFont(defaultFont )
  lg.setColor(1, 1, 1)
  lg.draw(bezel, 0, 0)
 


--  This is the screen space we have to work with
  -- screenSpace = {0.5,0.5,0.5}
  -- lg.setColor(screenSpace)
  -- lg.rectangle( "line", 80, 60, 640, 465)


  drawDesktopIcon(iconPhotosImage, 88, 100, "Photos")
  drawDesktopIcon(iconEmailImage, 85, 200, "eMail")
  drawDesktopIcon(iconTelescopeImage, 92, 300, "Telescope-view")
  drawDesktopIcon(iconTrashImage, 102, 400, "Trash")
  lg.setColor(0,0,0)
  if not Monitor then
  lg.rectangle("fill", 50, 25, windowWidth - 100, windowHeight - 50)
  end
  lg.setColor(1,0,0)
  lg.rectangle("fill", 25, 500, 70,70)
  simpleScale.unSet()
end

function computer:leave()
end

return computer
