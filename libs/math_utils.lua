lerp = function(a, b, t)
    return a + (b - a) * t
end
--Googled This
function wrap_number(value, min_val, max_val)
    local range = max_val - min_val
  
    local mod_result = (value - min_val) % range
 
    return mod_result + min_val
end
--add any kind of math helpers
function wrap_vector(value, max_val,start_val)
    local vector = value
    if vector.x > max_val.x then
    
        vector.x = start_val.x
   
    else if vector.y > max_val.y then
    
        vector.y =start_val.y
   
    elseif vector.x < start_val.x then
    
        vector.x = max_val.x
    
    if vector.y < start_val.y then
    
        vector.y =max_val.y 
    end
end
end
   
    return vector
end