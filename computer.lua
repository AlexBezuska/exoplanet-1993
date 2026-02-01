computer = {}
require "libs.desktopIcon"


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

  Telescope = false
  Photos = false
  Email = false
  Trash = false
end

function computer:enter()

end

function computer:update(dt)
  local mousepointx = love.mouse.getX()
  local mousepointy = love.mouse.getY()

  Telescope = self.telescopeClick:update(mousepointx, mousepointy)
  Photos = self.photosClick:update(mousepointx, mousepointy)
  Email = self.emailClick:update(mousepointx, mousepointy)
  Trash = self.trashClick:update(mousepointx, mousepointy)
  --icons now work
  print(Trash)
  if Telescope then
    Gamestate.switch(telescope)
  end
end

function computer:draw()
  simpleScale.set()
  lg.setColor(1, 1, 1)

  lg.setColor(desktopPurple)
  lg.rectangle("fill", 0, 0, windowWidth, windowHeight)

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

  simpleScale.unSet()
end

function computer:leave()
end

return computer
