Class = require 'libs.class'
require "libs.math_utils"
celestial_body = Class {}

     function celestial_body:init( posx, posy, body_radius,color)
        self.x = posx
        self.y = posy
        self.radius = body_radius
        self.color = color
    end;

   function  celestial_body:transit(x, y, transit_speed, dt)
        -- lerp to target(x,y) based speed
        self.x = lerp(self.x, x + 100, transit_speed * dt * 0.01)
        self.y = self.y + y
        local px = self.x
        --simple wrap 
        if self.x > x-self.radius then
        self.x = -100
        end
       
    end;

     function celestial_body: reset()
        self.x = 0
        self.y = 0
    end;
   
   function celestial_body: draw()
        --lg.setColor(self.color)
        --lg.circle("fill",self.x,self.y,self.radius * 1.1)
        lg.setColor(self.color)
        lg.circle("fill",  self.x,  self.y, self.radius)

    end;

return celestial_body