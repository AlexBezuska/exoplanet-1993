titlescreen = {}


local TypewriterText = require "libs.typewriterText"




function titlescreen:init()
    telescopeImage = lg.newImage("images/title-screen-telescope.png")
end

function titlescreen:enter()
    self.title = TypewriterText(titleFont, "Coincidence of Occlusion", { typeRate = 34 })
    self.starRotator = RotateByCenter({ speed = 0.01 })
    self.clockInClick = ClickableObject(0, 0, 0, 0)
    self.clockInRect = nil
end

function titlescreen:update(dt)
    self.title:update(dt)
    self.starRotator:update(dt)

    if self.clockInRect then
        local mouseX = love.mouse.getX()
        local mouseY = love.mouse.getY()
        self.clockInClick:setRect(self.clockInRect.x, self.clockInRect.y, self.clockInRect.w, self.clockInRect.h)
        if self.clockInClick:update(mouseX, mouseY) then
            Gamestate.switch(desk)
        end
    end
end

function titlescreen:draw()
    simpleScale.set()
    lg.setBackgroundColor(0,0,0.08)
    self.starRotator:draw(function() starbg:draw() end)
    lg.setColor(1, 1, 1)
    lg.draw(telescopeImage, 0, 0)

    drawLogo(100)

    lg.setFont(defaultFont)
    local rectX, rectY, rectW, rectH = drawPaddedLabel("Clock In", windowWidth / 2, 260, 20, 20)
    self.clockInRect = { x = rectX, y = rectY, w = rectW, h = rectH }

    -- restore to normal font
    lg.setFont(defaultFont)
    lg.setColor(1,1,1)
    lg.print("Created for Global Gam Jam 2026 by:\nImran Bharadia, Glenn Essex, Wren Slaven,\nEJ Curtis, fufroom (Alex Bezuska) and Aaron Goodwine",400,520)

    
    simpleScale.unSet()
end

function titlescreen:leave()

end


function drawLogo(fromTop)
  
    lg.setFont(titleFont)
    lg.setColor(1, 1, 1)
    local logoW = windowWidth
    local logoX = (logoW - titlescreen.title:fullWidth()) / 2
    titlescreen.title:draw(logoX, fromTop)
  
end

return titlescreen

