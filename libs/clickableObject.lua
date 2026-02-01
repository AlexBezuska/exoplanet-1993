local Class = require 'libs.class'

local ClickableObject = Class {}

local mousePressConsumed = false

function ClickableObject:init(x, y, width, height)
  self.x = x or 0
  self.y = y or 0
  self.width = width or 0
  self.height = height or 0
  self.isDown = false
end

function ClickableObject:setRect(x, y, width, height)
  self.x = x
  self.y = y
  self.width = width
  self.height = height
end

function ClickableObject:containsPoint(mouseX, mouseY)
  return mouseX >= self.x and mouseX <= (self.x + self.width) and mouseY >= self.y and mouseY <= (self.y + self.height)
end

function ClickableObject:update(mouseX, mouseY)
  mouseX = mouseX or love.mouse.getX()
  mouseY = mouseY or love.mouse.getY()

  local isMouseDown = love.mouse.isDown(1)
  if not isMouseDown then
    mousePressConsumed = false
  end

  self.isDown = isMouseDown and self:containsPoint(mouseX, mouseY)
  if self.isDown and not mousePressConsumed then
    mousePressConsumed = true
    return true
  end

  return false
end

return ClickableObject
