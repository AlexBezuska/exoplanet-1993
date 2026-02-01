email = {
  emails = require "email_text",
}

-- Toggle which *additional* emails are visible/clickable.
-- First four (email0-email3) are always visible/clickable.
local CLICKABLE_EMAILS = {
  email0 = true,
  email1 = true,
  email2 = true,
  email3 = true,
  email4 = false,
  email5 = false,
  email6 = false,
  email7 = false,
  email8 = false,
  email9 = false,
}

-- Timer-driven unlock config (main.lua calls email:unlockNextEmail())
local EMAIL_UNLOCK_INTERVAL_SECONDS = 60
local EMAIL_UNLOCK_ORDER = { "email4", "email5", "email6", "email7", "email8", "email9" }

local function limitToChars(value, limit)
  if value == nil then
    return ""
  end
  value = tostring(value)
  if #value <= limit then
    return value
  end
  return value:sub(1, limit) .. "..."
end

local function emailIndexFromKey(key)
  return tonumber(tostring(key):match("(%d+)$"))
end

local function isEmailClickable(key)
  local index = emailIndexFromKey(key)
  if index ~= nil and index < 4 then
    return true
  end
  return CLICKABLE_EMAILS[key] == true
end

local function getSortedEmailKeys(emails)
  local keys = {}
  for key, _ in pairs(emails or {}) do
    if tostring(key):match("^email%d+$") then
      table.insert(keys, key)
    end
  end
  table.sort(keys, function(a, b)
    return (emailIndexFromKey(a) or 0) < (emailIndexFromKey(b) or 0)
  end)
  return keys
end

-- Layout constants (game coordinates)
local EMAIL_WINDOW_X = 180
local EMAIL_WINDOW_Y = 60
local EMAIL_WINDOW_W = 530
local EMAIL_WINDOW_H = 460
local EMAIL_BAR_H = 30

local LIST_X = 180
local LIST_Y = 90
local LIST_W = 530
local LIST_H = 430

local ROW_H = 40
local ROW_TEXT_X = 185
local ROW_TEXT_Y_OFFSET = 12

local FROM_COL_W = 160
local COL_GAP = 10
local SUBJECT_CHAR_LIMIT = 80

local function getRowRect(rowIndex)
  return LIST_X, (LIST_Y + rowIndex * ROW_H), LIST_W, ROW_H
end

local function getOpenEmailWindowRect()
  local w, h = 440, 360
  local x = EMAIL_WINDOW_X + (EMAIL_WINDOW_W - w) / 2
  local y = EMAIL_WINDOW_Y + EMAIL_BAR_H + 20
  return x, y, w, h
end

local function drawPrintfBold(text, x, y, wrap, align)
  lg.printf(text, x, y, wrap, align)
  lg.printf(text, x + 1, y, wrap, align)
end

function email:getUnlockIntervalSeconds()
  return EMAIL_UNLOCK_INTERVAL_SECONDS
end

function email:unlockNextEmail()
  for _, key in ipairs(EMAIL_UNLOCK_ORDER) do
    if CLICKABLE_EMAILS[key] ~= true then
      CLICKABLE_EMAILS[key] = true
      self.unlockCount = (self.unlockCount or 0) + 1
      return key
    end
  end
  return nil
end

function email:init()
  self.ExitEmail = ClickableObject(688.5, 63.5, 15, 15)
  self.backButton = ClickableObject(25, 500, 70, 70)

  self.emailKeys = {}
  self.emailLineButtons = {}
  self.emailRead = {}

  self.openEmailKey = nil
  self.openEmailCloseButton = ClickableObject(0, 0, 0, 0)

  self.unlockCount = self.unlockCount or 0
end

function email:enter()
  self.emailKeys = getSortedEmailKeys(self.emails)

  -- One ClickableObject per email (rect updated based on visible rows).
  for i, key in ipairs(self.emailKeys) do
    local x, y, w, h = getRowRect(i - 1)
    if self.emailLineButtons[key] == nil then
      self.emailLineButtons[key] = ClickableObject(x, y, w, h)
    else
      self.emailLineButtons[key]:setRect(x, y, w, h)
    end

    if self.emailRead[key] == nil then
      self.emailRead[key] = false
    end
  end
end

function email:getVisibleEmailKeys()
  local visible = {}
  for _, key in ipairs(self.emailKeys or {}) do
    if isEmailClickable(key) then
      table.insert(visible, key)
    end
  end
  return visible
end

function email:update(dt)
  if self.ExitEmail:update() or self.backButton:update() then
    Gamestate.switch(computer)
    return
  end

  if self.openEmailKey ~= nil then
    if self.openEmailCloseButton:update() then
      self.openEmailKey = nil
    end
    return
  end

  local visibleKeys = self:getVisibleEmailKeys()
  for i, key in ipairs(visibleKeys) do
    local rowIndex = i - 1
    local button = self.emailLineButtons[key]
    if button ~= nil then
      local x, y, w, h = getRowRect(rowIndex)
      button:setRect(x, y, w, h)
      if button:update() then
        self.openEmailKey = key
        self.emailRead[key] = true
        local wx, wy, ww, wh = getOpenEmailWindowRect()
        self.openEmailCloseButton:setRect(wx + ww - 28, wy + 8, 20, 20)
        break
      end
    end
  end
end

function email:drawEmailLine(key, emailData, rowIndex)
  local x, y, w, h = getRowRect(rowIndex)
  local selected = (self.openEmailKey == key)
  local unread = (self.emailRead[key] ~= true)

  if selected then
    lg.setColor(0.85, 0.85, 0.85)
  else
    lg.setColor(0.75, 0.75, 0.75)
  end
  lg.rectangle("fill", x, y, w, h)

  -- Divider under row
  lg.setColor(0, 0, 0)
  lg.line(x, y + h, x + w, y + h)

  local fromX = ROW_TEXT_X
  local fromW = FROM_COL_W
  local subjectX = fromX + fromW + COL_GAP
  local subjectW = (x + w - 10) - subjectX

  -- White background behind subject cell
  lg.setColor(1, 1, 1)
  lg.rectangle("fill", subjectX - 4, y + 6, subjectW + 8, h - 12)

  lg.setColor(0, 0, 0)
  local senderText = emailData.sender or ""
  local subjectText = limitToChars(emailData.subject or "", SUBJECT_CHAR_LIMIT)

  if unread then
    drawPrintfBold(senderText, fromX, y + ROW_TEXT_Y_OFFSET, fromW, "left")
    drawPrintfBold(subjectText, subjectX, y + ROW_TEXT_Y_OFFSET, subjectW, "left")
  else
    lg.printf(senderText, fromX, y + ROW_TEXT_Y_OFFSET, fromW, "left")
    lg.printf(subjectText, subjectX, y + ROW_TEXT_Y_OFFSET, subjectW, "left")
  end
end

function email:drawOpenEmailWindow()
  if self.openEmailKey == nil then
    return
  end

  local emailData = self.emails[self.openEmailKey]
  if emailData == nil then
    return
  end

  local x, y, w, h = getOpenEmailWindowRect()

  -- Dim background behind popup
  lg.setColor(0, 0, 0, 0.25)
  lg.rectangle("fill", EMAIL_WINDOW_X, EMAIL_WINDOW_Y + EMAIL_BAR_H, EMAIL_WINDOW_W, EMAIL_WINDOW_H - EMAIL_BAR_H)

  -- Popup body
  lg.setColor(1, 1, 1)
  lg.rectangle("fill", x, y, w, h)
  lg.setColor(0, 0, 0)
  lg.rectangle("line", x, y, w, h)

  -- Close button
  lg.setColor(0.8, 0.05, 0.2)
  lg.rectangle("fill", x + w - 28, y + 8, 20, 20)
  lg.setColor(1, 1, 1)
  lg.print("X", x + w - 23, y + 7, 0, 1.25, 1.25)

  -- Header: From + Subject side-by-side
  lg.setColor(0, 0, 0)
  local leftColW = math.floor((w - 28) * 0.45)
  local rightColW = (w - 28) - leftColW
  lg.printf("From: " .. (emailData.sender or ""), x + 14, y + 12, leftColW, "left")
  lg.printf("Subject: " .. (emailData.subject or ""), x + 14 + leftColW, y + 12, rightColW, "left")
  lg.printf("To: " .. (emailData.recipient or ""), x + 14, y + 30, w - 28, "left")

  lg.line(x + 14, y + 52, x + w - 14, y + 52)
  lg.printf(emailData.body or "", x + 14, y + 62, w - 28, "left")
end

function email:draw()
  simpleScale.set()

  -- email window bar
  lg.setColor(0.05, 0.2, 0.8)
  lg.rectangle("fill", EMAIL_WINDOW_X, EMAIL_WINDOW_Y, EMAIL_WINDOW_W, EMAIL_BAR_H)

  -- email window close button
  lg.setColor(0.8, 0.05, 0.2)
  lg.rectangle("fill", 682, 62, 25, 25)

  -- email window body
  lg.setColor(0.7, 0.7, 0.7)
  lg.rectangle("fill", EMAIL_WINDOW_X, LIST_Y, EMAIL_WINDOW_W, LIST_H)

  -- list
  self.emailKeys = self.emailKeys or getSortedEmailKeys(self.emails)
  local visibleKeys = self:getVisibleEmailKeys()
  for i, key in ipairs(visibleKeys) do
    local rowIndex = i - 1
    local emailData = self.emails[key]
    if emailData ~= nil then
      self:drawEmailLine(key, emailData, rowIndex)
    end
  end

  -- window bar and close button text
  lg.setColor(1, 1, 1)
  lg.print("eMail", 185, 65, 0, 1.25, 1.25)
  lg.print("X", 688.5, 63.5, 0, 1.5, 1.5)

  lg.setColor(1, 1, 1)
  lg.draw(backButtonImage, 25, 500)

  -- open email popup
  self:drawOpenEmailWindow()

  simpleScale.unSet()
end

function email:leave()
end

return email