Class = require 'libs.class'
require "libs.math_utils"
Vector = require 'libs.vector'
celestial_body = Class {}
local scaleMultiplier = 0.001
isdone = false
function celestial_body:init(img,pos,target,body_radius, speed,color)
  if img then self.img = img end
  self.pos = Vector(pos.x, pos.y)
  self.target = target
  self.start = Vector(pos.x, pos.y)
  self.scale = .1
  self.radius = body_radius
  self.speed = speed
  self.color = color
  self.isdone = false
end
function GetDone(self)
  return self.isdone
end
function celestial_body:transit(dt)
     local dir = self.target
     local len = math.sqrt(dir.x ^ 2 + dir.y ^ 2)
     if len > 0 then
          dir.x = dir.x / len
          dir.y = dir.y / len
     end
     self.pos.x = self.pos.x + (dir.x * self.speed) * dt
     self.pos.y = self.pos.y + (dir.y * self.speed) * dt

print(self.pos.x)
     if self.pos.x < 0 or self.pos.x > windowWidth or
         self.pos.y < 0 or self.pos.y > windowHeight then
          self.isdone = true
          
         --- self.pos.x = self.start.x
          ---self.pos.y = self.start.y
           ---dir.x = self.target.x
           ---dir.y = self.target.y
     end
     --print(self.pos)
end

function celestial_body:reset()
     self.pos.x = 0
     self.pos.y = 0
end

function celestial_body:draw()
  lg.setColor(self.color)
  self.scale = self.scale + scaleMultiplier
  if self.img then
    lg.draw(self.img,self.pos.x,self.pos.y,0,self.scale,self.scale,self.img:getWidth()/2,self.img:getHeight()/2)
  else
    lg.circle("fill", self.pos.x, self.pos.y, self.radius+(self.scale))
  end
end
function GetCelestialBodyPos (self)
  return self.pos
end
return celestial_body
