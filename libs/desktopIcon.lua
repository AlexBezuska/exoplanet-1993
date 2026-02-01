function drawDesktopIcon(image, x, y, filename)
  local iconSize = 48

  local oldR, oldG, oldB, oldA = lg.getColor()
  local oldFont = lg.getFont()
  local  font = oldFont

  if image then
    local iw, ih = image:getDimensions()
    local scale = math.min(iconSize / iw, iconSize / ih)
    local drawW = iw * scale
    local drawH = ih * scale
    local dx = x + (iconSize - drawW) / 2
    local dy = y + (iconSize - drawH) / 2

    lg.setColor(1, 1, 1, 1)
    lg.draw(image, dx, dy, 0, scale, scale)
  else
    lg.setColor(0.7, 0.7, 0.7, 1)
    lg.rectangle("fill", x, y, iconSize, iconSize)
    lg.setColor(0.3, 0.3, 0.3, 1)
    lg.rectangle("line", x, y, iconSize, iconSize)
  end

  local text = filename or ""
  local textW = font:getWidth(text)
  local rectW = math.max(iconSize, textW + 4 * 2)
  local rectH = font:getHeight() + 2 * 2
  local rectX = x + (iconSize - rectW) / 2
  local rectY = y + iconSize + 4

  lg.setColor(1, 1, 1, 1)
  lg.rectangle("fill", rectX, rectY, rectW, rectH)

  lg.setColor(0, 0, 0, 1)
  lg.print(text, rectX + (rectW - textW) / 2, rectY + 4)

  lg.setFont(oldFont)
  lg.setColor(oldR, oldG, oldB, oldA)
end
