Class = require 'libs.class'
require "libs.math_utils"
Vector = require 'libs.vector'
celestial_body = Class {}

     function celestial_body:init(pos, body_radius,color)
        self.pos =Vector(pos.x,pos.y)
       
        self.radius = body_radius
        self.color = color
    end;

   function  celestial_body:transit(target, transit_speed, dt)
        -- lerp to target(x,y) based speed
        local dir = self.pos - target 
        dir = dir:rotated(math.rad(math.atan2(dir.y,dir.x)))
        self.pos.x = lerp(self.pos.x, dir.x, transit_speed * dt * 0.01)
        self.pos.y = lerp(self.pos.y, dir.y, transit_speed * dt * 0.01)

         print(dir)
        --simple wrap 
        self.pos.x = wrap_number(self.pos.x,0,windowWidth -1)
       
       
    end;

     function celestial_body: reset()
        self.pos.x = 0
       self.pos.y = 0
    end;
   
   function celestial_body: draw()
        --lg.setColor(self.color)
        --lg.circle("fill",self.x,self.y,self.radius * 1.1)
        lg.setColor(self.color)
        lg.circle("fill",  self.pos.x,  self.pos.y, self.radius)

    end;

return celestial_body