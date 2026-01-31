lerp = function(a, b, t)
    return a + (b - a) * t
end
wrap = function(a, max, min)
    if a > max then
        a = min
    end
    return a

end
--add any kind of math helpers