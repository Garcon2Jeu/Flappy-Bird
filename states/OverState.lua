OverState = Class { __includes = BaseState }

function OverState:init() end

function OverState:update(dt)
    if app:wasKeyPressed("return") then
        state:change("start")
    end
end

function OverState:draw()
    love.graphics.setFont(app.fonts.big)
    love.graphics.printf("Game Over", 0, CENTER_HEIGHT - 100, VIRTUAL_WIDTH, "center")
    love.graphics.setFont(app.fonts.medium)
    love.graphics.printf("Score = " .. self.score, 0, CENTER_HEIGHT - 50, VIRTUAL_WIDTH, "center")
    love.graphics.printf("Press Return to Play again", 0, CENTER_HEIGHT, VIRTUAL_WIDTH, "center")
end

function OverState:enter(params)
    self.score = tostring(params)
end

function OverState:exit() end
