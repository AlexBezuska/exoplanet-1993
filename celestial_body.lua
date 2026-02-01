Class = require 'libs.class'
require "libs.math_utils"
Vector = require 'libs.vector'
celestial_body = Class {}

     function celestial_body:init(pos, body_radius,color)
        self.pos =Vector(pos.x,pos.y)
        self.start = Vector(pos.x,pos.y)
        self.radius = body_radius
        self.color = color
       
    end;

   function  celestial_body:transit(target, transit_speed, dt)
        -- lerp to target(x,y) based speed
        local dir = -target 
        local length = (dir.x^2 + dir.y ^ 2)
       
        self.pos.x = self.pos.x +dir.x * transit_speed * dt
        self.pos.y = self.pos.y + dir.y * transit_speed * dt 

        --simple wrap 
    
     self.pos = wrap_vector(self.pos,Vector(windowWidth,widthHeight),self.start)
        
        

          print(self.pos)
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