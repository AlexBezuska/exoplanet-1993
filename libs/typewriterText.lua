Class = require 'libs.class'

TypewriterText = Class {}

function TypewriterText:init(font, text, opts)
    self.font = font
    self.text = text or ""
    opts = opts or {}

    self.typeRate = opts.typeRate or 22 -- characters per second

    self:reset()
end

function TypewriterText:reset()
    self.index = 0
    self.typeTimer = 0
end

function TypewriterText:setText(text)
    self.text = text or ""
    self:reset()
end

function TypewriterText:isDone()
    return (self.index or 0) >= #self.text
end

function TypewriterText:shown()
    return string.sub(self.text, 1, self.index or 0)
end

function TypewriterText:fullWidth()
    return self.font:getWidth(self.text)
end

function TypewriterText:height()
    return self.font:getHeight()
end

function TypewriterText:update(dt)
    -- type-in effect
    if (self.index or 0) < #self.text then
        self.typeTimer = (self.typeTimer or 0) + dt
        local step = 1 / (self.typeRate or 22)
        while self.typeTimer >= step and self.index < #self.text do
            self.typeTimer = self.typeTimer - step
            self.index = self.index + 1
        end
    end
end

function TypewriterText:draw(x, y, opts)
    local gfx = (opts and opts.lg) or _G.lg

    local oldFont = gfx.getFont and gfx.getFont() or nil
    if self.font then gfx.setFont(self.font) end

    local s = self:shown()
    gfx.print(s, x, y)

    if oldFont then gfx.setFont(oldFont) end
end

return TypewriterText
