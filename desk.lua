local bg_audio = love.audio.newSource('sfx/bg-sfx-final.wav', 'static')
bg_audio:setVolume(0.5)



desk = {}

function desk:init()
  
  deskViewImage = lg.newImage("images/desk-view.png")
  iconPhotosImage = lg.newImage("images/icon-photos.png")

  self.computerClick = ClickableObject(150, 250, 350, 300)

  bg_audio:setLooping(true)
  bg_audio:play()
end

function desk:enter()

end

function desk:update(dt)
  if self.computerClick:update() then
    Gamestate.switch(computer)
  end
end

function desk:draw()
  simpleScale.set()
  lg.setColor(1,1,1)
  lg.print("desk",100,100)
  lg.setColor(130/255,53/255,109/255)
  lg.rectangle( "fill", 0, 0, windowWidth, windowHeight)

  lg.setColor(1,1,1)
  lg.draw( deskViewImage, 0,0)

  lg.setColor(1,1,1)
  lg.print("I am computer",100,100)
  simpleScale.unSet()

end

function desk:leave()
end

return desk
