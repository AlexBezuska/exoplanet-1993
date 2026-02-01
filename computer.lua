computer = {}
require "libs.desktopIcon"


function computer:init()
  bezel = lg.newImage("images/screen-bezel.png")
  iconPhotosImage = lg.newImage("images/icon-photos.png")
  iconEmailImage = lg.newImage("images/icon-email.png")
  iconTelescopeImage = lg.newImage("images/icon-photos.png")
  iconTrashImage = lg.newImage("images/icon-trash.png")


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


  drawDesktopIcon(iconPhotosImage, 88, 100, "Photos")
  drawDesktopIcon(iconEmailImage, 85, 200, "eMail")
  drawDesktopIcon(iconTelescopeImage, 92, 300, "Telescope-view")
  drawDesktopIcon(iconTrashImage, 102, 400, "Trash")

  simpleScale.unSet()
end

function computer:leave()
end

return computer
