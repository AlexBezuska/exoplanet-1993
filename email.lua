email = {
  emails = require "email_text"
}



function email:init()
 

  self.ExitEmail =   ClickableObject( 688.5, 63.5,15,15)
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
  lg.line(330, 90, 330, 520)
  --horizontal (line every 50px down)
  lg.line(180, 140, 330, 140)
  lg.line(180, 185, 330, 185)
  lg.line(180, 225, 330, 225)
  lg.line(180, 265, 330, 265)
  lg.line(180, 305, 330, 305)
  lg.line(180, 345, 330, 345)
  lg.line(180, 385, 330, 385)
  lg.line(180, 425, 330, 425)
  lg.line(180, 465, 330, 465)
  --email text
  lg.setColor(0, 0, 0)
  lg.printf(self.emails.email0.sender, 200, 100, 200, "left")
  lg.printf(self.emails.email0.subject, 200, 115, 200, "left")
  --window bar and close button text
  lg.setColor(1, 1, 1)
  lg.print("eMail", 185, 65, 0, 1.25, 1.25)
  lg.print("X", 688.5, 63.5, 0, 1.5, 1.5)

  simpleScale.unSet()
end

function email:leave()
end

return email