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
function wrap_vector(value, max_val, start_val)
    local width = max_val.x - start_val.x
    local height = max_val.y - start_val.y
    
   
    value.x = start_val.x + (value.x - start_val.x) % width
    value.y = start_val.y + (value.y - start_val.y) % height
    
    return value
end