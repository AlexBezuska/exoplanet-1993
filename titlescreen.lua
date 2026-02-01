titlescreen = {}

local titleFont = lg.newFont("fonts/LCDM2U.TTF", 40)
local TypewriterText = require "libs.typewriterText"


function titlescreen:init()
    telescopeImage = lg.newImage("images/title-screen-telescope.png")
end

function titlescreen:enter()
    self.title = TypewriterText(titleFont, "Coincidence of Occlusion", { typeRate = 22 })
end

function titlescreen:update(dt)
    self.title:update(dt)
end

function titlescreen:draw()
    simpleScale.set()
    lg.setBackgroundColor(0,0,0.08)
    starbg:draw()
    lg.setColor(1, 1, 1)
    lg.draw(telescopeImage, 0, 0)
     drawLogo(100)
    simpleScale.unSet()
end

function titlescreen:leave()

end


function drawLogo(fromTop)
    local oldFont = lg.getFont()
    lg.setFont(titleFont)
    lg.setColor(1, 1, 1)
    local logoW = windowWidth
    local logoX = (logoW - titlescreen.title:fullWidth()) / 2
    titlescreen.title:draw(logoX, fromTop)
    lg.setFont(oldFont)
end

return titlescreen

