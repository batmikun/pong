BALL = {}

local speed_operator = {
    ["+"] = function(value) return value end,
    ["-"] = function(value) return -value end
}

function  BALL:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.img = love.graphics.newImage("assets/ball.jpg")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 400
    self.x_vel = -self.speed
    self.y_vel = 0
end

function BALL:update(dt)
    self:move(dt)
    self:collide()
    self:DetectBorders()
    self:DetectGoal()
end

function BALL:draw()
    love.graphics.draw(self.img, self.x, self.y)
end

function BALL:move(dt)
    self.x = self.x + self.x_vel * dt
    self.y = self.y + self.y_vel * dt
end

function BALL:collide()
    self:CheckCollisions(PLAYER, "+")
    self:CheckCollisions(AI, "-")
end

function BALL:CheckCollisions(object, operator)
    if CheckCollisions(self, object) then
        self.x_vel = speed_operator[operator](self.speed)
        local collision_position = self.ObtainMiddlePoint(self, object)
        self.y_vel = collision_position * 5
    end
end

function BALL:ObtainMiddlePoint(object)
    local ball_middle = self.y + self.height / 2
    local object_middle = object.y + object.height / 2500
    return  ball_middle - object_middle
end

function BALL:DetectBorders()
    if self.y < 0 then
        self.y = 0
        self.y_vel = -self.y_vel
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.y_vel = -self.y_vel
    end
end

function BALL:DetectGoal()
    if self.x < 0 then
        print("GOAL FOR THE AI")
        self:ResetPosition()
    elseif self.x + self.width > love.graphics.getWidth() then
        print("GOAL FOR THE PLAYER")
        self:ResetPosition()
    end
end

function BALL:ResetPosition()
    self.x = love.graphics.getWidth() / 2 - self.width / 2
    self.y = love.graphics.getHeight() / 2 - self.height / 2
end
