Class = require 'libs.class'
require "libs.math_utils"
Vector = require 'libs.vector'
celestial_body = Class{}

--[[<<<<<<< Updated upstream
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
=======
--]]function celestial_body:init(line,body_radius,speed,color)
  self.line = line
  self.pos = {x=line[1],y=line[2]}
  self.radius = body_radius
  self.speed = speed
  self.color = color
end

function celestial_body:transit(dt)
 -- print(self.line[1],self.line[2],self.line[3],self.line[4])
  local dx,dy = self.line[3] - self.pos.x,self.line[4] - self.pos.y
  local angle = math.atan2(dy,dx)
  self.pos.x = self.pos.x + self.speed * math.cos(angle) * dt
  self.pos.y = self.pos.y + self.speed * math.sin(angle) * dt
  --[[local targetX = windowWidth - self.pos.x
  local targetY = windowHeight - self.pos.y
  local dx = targetX - self.pos.x
  local dy = targetY - self.pos.y
  local angle = math.atan2(dy,dx)
  self.pos.x = self.pos.x + self.speed * math.cos(angle) * dt
  self.pos.y = self.pos.y + self.speed * math.sin(angle) * dt
  ]]--
  --[[
  self.velocity = self.velocity + delta * transit_speed * dt
  -- lerp to target(x,y) based speed
  local dir = -target 
  local length = (dir.x^2 + dir.y ^ 2)
  self.pos.x = self.pos.x +dir.x * transit_speed * dt
  self.pos.y = self.pos.y + dir.y * transit_speed * dt 
  --simple wrap
  self.pos = wrap_vector(self.pos,Vector(windowWidth,widthHeight),self.start)
  --print(self.pos)
  ]]--
  
end


function celestial_body: reset()
  self.pos.x = 0
  self.pos.y = 0
end
   
function celestial_body: draw()
  --lg.setColor(self.color)
  --lg.circle("fill",self.x,self.y,self.radius * 1.1)
  lg.setColor(self.color)
  lg.circle("fill", self.pos.x,  self.pos.y, self.radius)
end
  
-->>>>>>> Stashed changes
--]]


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
