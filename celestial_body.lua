Class = require 'libs.class'
require "libs.math_utils"
Vector = require 'libs.vector'
celestial_body = Class {}

function celestial_body:init(pos, body_radius, color)
     self.pos = Vector(pos.x, pos.y)
     self.start = Vector(pos.x, pos.y)
     self.radius = body_radius
     self.color = color
end;

function celestial_body:transit(target, transit_speed, dt)
     local dir = target

     local len = math.sqrt(dir.x ^ 2 + dir.y ^ 2)
     if len > 0 then
          dir.x = dir.x / len
          dir.y = dir.y / len
     end



     self.pos.x = self.pos.x + (dir.x * transit_speed) * dt
     self.pos.y = self.pos.y + (dir.y * transit_speed) * dt


     if self.pos.x < 0 or self.pos.x > windowWidth or
         self.pos.y < 0 or self.pos.y > widthHeight then
          self.pos.x = self.start.x
          self.pos.y = self.start.y
     end
     print(self.pos)
end

function celestial_body:reset()
     self.pos.x = 0
     self.pos.y = 0
end;

function celestial_body:draw()
     --lg.setColor(self.color)
     --lg.circle("fill",self.x,self.y,self.radius * 1.1)
     lg.setColor(self.color)
     lg.circle("fill", self.pos.x, self.pos.y, self.radius)
end;

return celestial_body
