Class = require 'libs.class'
Starfield = Class{}
function Starfield:init(seed, size_x, size_y, start_radius)
    self.start_radius = start_radius
    self.size_x = size_x
    self.size_y = size_y
    self.stars = {} 
    
    self.seed =  seed
   
    self:generate_star_field() 
end

function Starfield:generate_star_field()
    for x =  -50, self.size_x + 50 , 50 do
        for y = -50, self.size_y + 50, 50 do
            self.seed_radius = love.math.random(self.seed +x/self.size_x + y/self.size_y,1)
            
            local color = { love.math.random(0.5,1.0 ), love.math.random(0.5,1.0),love.math.random(0.5,1.0), love.math.random(0.5,1.0)}
            table.insert(self.stars, {x = x + love.math.random(x), y = y + love.math.random(y),color=color})
        end
    end
end

function Starfield:draw_star(lg, px, py)
    lg.circle("fill",px,py,self.seed_radius)
end

function Starfield:draw()
    for _, star in ipairs(self.stars) do
       -- print(star.color[1])
       lg.setColor( star.color)
       self:draw_star(lg, star.x, star.y)
        
    
    end
end

return Starfield