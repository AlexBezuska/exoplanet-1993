local function drawPaddedLabel(text, centerX, topY, paddingX, paddingY, options)
  options = options or {}
  local gfx = options.lg or _G.lg
  local font = options.font or gfx.getFont()

  local oldR, oldG, oldB, oldA = gfx.getColor()
  local oldFont = gfx.getFont()

  if font and font ~= oldFont then
    gfx.setFont(font)
  end

  paddingX = paddingX or options.paddingX or 4
  paddingY = paddingY or options.paddingY or 2
  local minWidth = options.minWidth or 0

  local s = text or ""
  local textW = font:getWidth(s)
  local textH = font:getHeight()
  local rectW = math.max(minWidth, textW + paddingX * 2)
  local rectH = textH + paddingY * 2
  local rectX = centerX - rectW / 2
  local rectY = topY

  local bg = options.bgColor or { 1, 1, 1, 1 }
  gfx.setColor(bg)
  gfx.rectangle("fill", rectX, rectY, rectW, rectH)

  local tc = options.textColor or { 0, 0, 0, 1 }
  gfx.setColor(tc)
  local textX = rectX + (rectW - textW) / 2
  local textY = rectY + paddingY
  gfx.print(s, textX, textY)

  gfx.setFont(oldFont)
  gfx.setColor(oldR, oldG, oldB, oldA)

  return rectX, rectY, rectW, rectH
end

return drawPaddedLabel
