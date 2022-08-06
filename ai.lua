AI = {}

function AI:load()
    self.img = love.graphics.newImage("assets/ai.jpg")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2
    self.speed = 500
    self.y_vel = 0
    self.timer = 0
    self.rate = 0.5
end

function AI:update(dt)
    self:Move(dt)
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        self:AquireTarget()
    end
    self:DetectBorders()
end

function AI:draw()
    love.graphics.draw(self.img, self.x ,self.y)
end

function AI:Move(dt)
    self.y = self.y + self.y_vel * dt
end

function AI:AquireTarget()
    if BALL.y + BALL.height < self.y then
        self.y_vel = -self.speed
    elseif BALL.y > self.y + self.height then
        self.y_vel = self.speed
    else
        self.y_vel = 0
    end
end


function AI:DetectBorders()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end