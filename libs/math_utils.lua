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