

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
  local centerX = x + iconSize / 2
  local topY = y + iconSize + 4
  drawPaddedLabel(text, centerX, topY, 4, 2, { font = font, minWidth = iconSize })

  lg.setFont(oldFont)
  lg.setColor(oldR, oldG, oldB, oldA)
end
