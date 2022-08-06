BACKGROUND = {
    background = love.graphics.newImage("assets/background.png"),
}

function BACKGROUND:load()
end

function BACKGROUND:update(dt)
end

function BACKGROUND:draw()
    love.graphics.draw(self.background, 0, 0)
end