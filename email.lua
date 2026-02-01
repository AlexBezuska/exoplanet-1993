email = {
  emails = require "email_text"
}

function limitToChars(string, limit)
  return string:sub(1,limit) .. "..."
end

function email:init()
 

  self.ExitEmail =   ClickableObject( 688.5, 63.5,15,15)
  self.backButton = ClickableObject(25, 500, 70,70)
end

function email:enter()
  print(self.emails)
end

function email:update(dt)
  if self.ExitEmail:update() then
    Gamestate.switch(computer)
  end
end

function email:draw()
  simpleScale.set()
  --computer:draw()
  lg.setColor(1,1,1)
  lg.print("email",100,100)
  --email window bar 
  lg.setColor(0.05, 0.2, 0.8)
  lg.rectangle("fill", 180, 60, 530, 30)
  --email window close button
  lg.setColor(0.8, 0.05, 0.2)
  lg.rectangle("fill",682, 62, 25, 25)
  --email window body
  lg.setColor(0.7, 0.7, 0.7)
  lg.rectangle("fill", 180, 90, 530, 430)
  --division lines
  --vertical
  lg.setColor(0, 0, 0)
  lg.line(360, 90, 360, 520)
  --horizontal (line every 40px down)
  lg.line(180, 140, 360, 140)
  lg.line(180, 185, 360, 185)
  lg.line(180, 225, 360, 225)
  lg.line(180, 265, 360, 265)
  lg.line(180, 305, 360, 305)
  lg.line(180, 345, 360, 345)
  lg.line(180, 385, 360, 385)
  lg.line(180, 425, 360, 425)
  lg.line(180, 465, 360, 465)
  --email text
  --limit subject length to 21 chars
  lg.printf(self.emails.email0.sender, 185, 100, 200, "left")
  lg.printf(limitToChars(self.emails.email0.subject, 21), 185, 115, 200, "left")

  lg.printf(self.emails.email1.sender, 185, 150, 200, "left")
  lg.printf(limitToChars(self.emails.email1.subject,21), 185, 165, 200, "left")

  lg.printf(self.emails.email2.sender, 185, 190, 200, "left")
  lg.printf(limitToChars(self.emails.email2.subject,21), 185, 205, 200, "left")

  lg.printf(self.emails.email3.sender, 185, 230, 200, "left")
  lg.printf(limitToChars(self.emails.email3.subject, 21), 185, 220, 200, "left")

  
  --window bar and close button text
  lg.setColor(1, 1, 1)
  lg.print("eMail", 185, 65, 0, 1.25, 1.25)
  lg.print("X", 688.5, 63.5, 0, 1.5, 1.5)


  lg.setColor(1,1,1)
  lg.draw( backButtonImage, 25, 500)

  simpleScale.unSet()
end

function email:leave()
end

return email