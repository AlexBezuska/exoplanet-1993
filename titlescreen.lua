titlescreen = {}

function titlescreen:init()
end

function titlescreen:enter()
    print(starbg)
end

function titlescreen:update(dt)
end

function titlescreen:draw()
    simpleScale.set()
    lg.setBackgroundColor(0,0,0.08)
    starbg:draw()
    simpleScale.unSet()
end

function titlescreen:leave()

end

return titlescreen