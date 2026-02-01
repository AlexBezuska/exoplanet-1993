telescope = {}
telescopeTimestampFont = lg.newFont("fonts/FiraCode-Regular.ttf", 24)
telescopeStatusTextFont = lg.newFont("fonts/FiraCode-Regular.ttf", 16)
local bezel = lg.newImage("images/screen-bezel.png")

function telescope:init()
  self.backButton = ClickableObject(25, 500, 70, 70)
end

function telescope:enter()
  print("entering telescope")
end

function telescope:update(dt)
  if self.backButton:update() then
    Gamestate.switch(computer)
  end
end

function telescope:draw()
  simpleScale.set()

  --  Clestial objects stuff
  lg.setBackgroundColor(0, 0, 0)
  starbg:draw()
  telescope.star:draw()
  for _, obj in ipairs(visibleObjects) do
    obj:draw()
  end


  -- Timestamp Stuff

  lg.setFont(telescopeTimestampFont)
  date1993 = os.date("1993/%m/%d")
  time1993 = os.date("%H:%M:%S")
  drawPaddedLabel(date1993 .. "\n" .. time1993, 650, 0, 21, 50,
    { bgColor = { 0 / 255, 56 / 255, 255 / 255 }, textColor = { 1, 1, 1 } })


  --  Telescope status text stuff
  telescopeStatusText =
  "Optics:          Tracking\nMount Motors:    Idle\nShutter State:   Open\nTarget Altitude: 15.14°\nDome Altitude:   14.96°\nTarget Azimuth:  92.81°\nDome Azimuth:    92.78°\nPosition Update: 2 remaining"
  lg.setFont(telescopeStatusTextFont)
  drawPaddedLabel(telescopeStatusText, 220, 290, 21, 50, { bgColor = { 0, 0, 0, 0 }, textColor = { 1, 1, 1 } })

  --  Bezel stuff

  lg.setColor(1, 1, 1)
  lg.draw(bezel, 0, 0)
  lg.setFont(defaultFont)


  --  Back button stuff
  lg.setColor(1, 1, 1)
  lg.draw(backButtonImage, 25, 500)

  simpleScale.unSet()
end

function telescope:leave()

end

return telescope
