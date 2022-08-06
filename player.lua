PLAYER = {}

function PLAYER:load()
    self.x = 50
    self.y = love.graphics.getHeight() / 2
    self.img = love.graphics.newImage("assets/player.jpg")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 500
end

function PLAYER:update(dt)
    self:Move(dt)

    self:DetectBorders()
end

function PLAYER:draw()
   love.graphics.draw(self.img, self.x, self.y)
end

function PLAYER:Move(dt)
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end

function PLAYER:DetectBorders()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end