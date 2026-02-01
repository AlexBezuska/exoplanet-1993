computer = {}
require "libs.desktopIcon"


function computer:init()
  bezel = lg.newImage("images/screen-bezel.png")
  iconPhotosImage = lg.newImage("images/icon-photos.png")
  iconEmailImage = lg.newImage("images/icon-email.png")
  iconTelescopeImage = lg.newImage("images/icon-photos.png")
  iconTrashImage = lg.newImage("images/icon-trash.png")
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

  Mousepos = Vector(mousepointx, mousepointy)
  local teledir = Vector(92, 300) - Mousepos
  local photosdir = Vector(88, 100) - Mousepos
  local emaildir = Vector(85, 200) - Mousepos
  local trashdir = Vector(102, 400) - Mousepos
  Telescope = love.mouse.isDown(1) and math.sqrt(teledir.x ^ 2 + teledir.y ^ 2) < 70
  Photos =  love.mouse.isDown(1) and math.sqrt(photosdir.x ^ 2 + photosdir.y ^ 2) < 70
  Email = love.mouse.isDown(1) and  math.sqrt(emaildir.x ^ 2 + emaildir.y ^ 2) < 70
  Trash = love.mouse.isDown(1) and  math.sqrt(trashdir.x ^ 2 + trashdir.y ^ 2) < 70
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
  lg.rectangle("fill", 0, 0, windowWidth, widthHeight)

  lg.setColor(1, 1, 1)
  lg.draw(bezel, 0, 0)

  --  This is the screen space we have to work with
  screenSpace = { 0.5, 0.5, 0.5 }
  lg.setColor(screenSpace)
  lg.rectangle("line", 80, 60, 640, 465)


  drawDesktopIcon(iconPhotosImage, 88, 100, "Photos")
  drawDesktopIcon(iconEmailImage, 85, 200, "eMail")
  drawDesktopIcon(iconTelescopeImage, 92, 300, "Telescope-view")
  drawDesktopIcon(iconTrashImage, 102, 400, "Trash")

  simpleScale.unSet()
end

function computer:leave()
end

return computer
