computer = {}
require "libs.desktopIcon"
computerClockFont = lg.newFont("fonts/FiraCode-Regular.ttf", 15)

function computer:init()
  bezel = lg.newImage("images/screen-bezel.png")
  --iconPhotosImage = lg.newImage("images/icon-photos.png")
  iconEmailImage = lg.newImage("images/icon-email.png")
  iconTelescopeImage = lg.newImage("images/icon-photos.png")
  iconTrashImage = lg.newImage("images/icon-trash.png")


  self.telescopeClick = ClickableObject(92, 300, 70, 70)
  --self.photosClick = ClickableObject(88, 100, 70, 70)
  self.emailClick = ClickableObject(85, 200, 70, 70 )
  self.trashClick = ClickableObject(102, 400, 70, 70)
  self.backButton = ClickableObject(25, 500, 70,70)
  --self.monitorToggle = ClickableObject(25, 500, 70,70)
  Telescope = false
  Photos = false
  Email = false
  Trash = false
 
end

function computer:enter()

end

function computer:update(dt)
  date1993 = os.date("1993/%m/%d")
  time1993 = os.date("%H:%M:%S")
  local mousepointx = love.mouse.getX()
  local mousepointy = love.mouse.getY()

  Telescope = self.telescopeClick:update(mousepointx, mousepointy)
  --Photos = self.photosClick:update(mousepointx, mousepointy)
  Email = self.emailClick:update(mousepointx, mousepointy)
  Trash = self.trashClick:update(mousepointx, mousepointy)

  if Telescope then
    Gamestate.switch(telescope)
  elseif Email then
    Gamestate.push(email)
  elseif Photos then
    Gamestate.push(archive)
  elseif Trash then
    --Gamestate.push(Trash)
  end

  if self.backButton:update() then
    Gamestate.switch(desk)
  end
end

function computer:draw()
  simpleScale.set()
  lg.setColor(1, 1, 1)

  lg.setColor(desktopPurple)
  lg.rectangle("fill", 0, 0, windowWidth, windowHeight)


  lg.setColor({ 0.3, 0.3, 0.3 })
  lg.rectangle("fill", 0, windowHeight - 100, windowWidth, 100)

  lg.setFont(computerClockFont)
  lg.setColor(1, 1, 1)
  lg.print(date1993 .. " " .. time1993, windowWidth - 260, windowHeight - 90)
  lg.setFont(defaultFont)
  lg.setColor(1, 1, 1)
  lg.draw(bezel, 0, 0)


 -- drawDesktopIcon(iconPhotosImage, 88, 100, "Photos")
  drawDesktopIcon(iconEmailImage, 85, 200, "eMail")
  drawDesktopIcon(iconTelescopeImage, 92, 300, "Telescope-view")
  drawDesktopIcon(iconTrashImage, 102, 400, "Trash")

  lg.setColor(1,1,1)
  lg.draw( backButtonImage, 25, 500)
  
  lg.setColor(0, 0, 0)
 
  lg.setColor(1, 0, 0)
  lg.rectangle("fill", 25, 500, 70, 70)
  
  lg.setColor(0,0,0)
  if not Monitor then
  --lg.rectangle("fill", 50, 25, windowWidth - 100, windowHeight - 50)
  end
  lg.setColor(1,0,0)
  lg.rectangle("fill", 25, 500, 70,70)
  
  --[[
  lg.rectangle("line",self.telescopeClick.x,self.telescopeClick.y,self.telescopeClick.width,self.telescopeClick.height)
  lg.rectangle("line",self.photosClick.x,self.photosClick.y,self.photosClick.width,self.photosClick.height)
  lg.rectangle("line",self.emailClick.x,self.emailClick.y,self.emailClick.width,self.emailClick.height)
  lg.rectangle("line",self.trashClick.x,self.trashClick.y,self.trashClick.width,self.trashClick.height)
  ]]--
  
  simpleScale.unSet()
end

function computer:leave()
end

return computer
