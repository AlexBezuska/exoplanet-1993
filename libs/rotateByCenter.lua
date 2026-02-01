local Class = require 'libs.class'

local RotateByCenter = Class {}

-- opts:
--   speed: radians per second
--   angle: starting angle (radians)
--   getSize: function() -> { w = number, h = number }
function RotateByCenter:init(opts)
    opts = opts or {}

    self.speed = opts.speed or 0
    self.angle = opts.angle or 0

    self.getSize = opts.getSize or function()
        local w = windowWidth or width or 800
        local h = widthHeight or height or 600
        return { w = w, h = h }
    end
end

function RotateByCenter:update(dt)
    self.angle = (self.angle or 0) + dt * (self.speed or 0)
end

function RotateByCenter:begin(gfx)
    gfx = gfx or _G.lg

    local size = self.getSize()
    local w = size.w
    local h = size.h

    gfx.push()
    gfx.translate(w / 2, h / 2)
    gfx.rotate(self.angle or 0)
    gfx.translate(-w / 2, -h / 2)
end

function RotateByCenter:finish(gfx)
    gfx = gfx or _G.lg
    gfx.pop()
end

-- drawFn: function() that does the actual drawing while rotated.
function RotateByCenter:draw(drawFn, gfx)
    self:begin(gfx)
    drawFn()
    self:finish(gfx)
end

return RotateByCenter
