require("background")
require("player")
require("ball")
require("ai")

function love.load()
    BACKGROUND:load()
    PLAYER:load()
    BALL:load()
    AI:load()
end

function love.update(dt)
    BACKGROUND:update(dt)
    PLAYER:update(dt)
    BALL:update(dt)
    AI:update(dt)
end

function love.draw()
    BACKGROUND:draw()
    PLAYER:draw()
    BALL:draw()
    AI:draw()
end

function CheckCollisions(track_shape, shape)
    if track_shape.x + track_shape.width > shape.x and track_shape.x < shape.x + shape.width and track_shape.y + track_shape.height > shape.y and track_shape.y < shape.y + shape.height then
        return true
    else
        return false
    end
end
