StartState = Class { __includes = BaseState }

function StartState:update(dt)
    if app:wasKeyPressed("space") then
        state:change("countdown")
    end
end

function StartState:draw()
    love.graphics.setFont(app.fonts.huge)
    love.graphics.printf("Flappy Bird", 0, 100, VIRTUAL_WIDTH, "center")

    love.graphics.setFont(app.fonts.medium)
    love.graphics.printf("Press Space to Play", 0, 175, VIRTUAL_WIDTH, "center")
end
