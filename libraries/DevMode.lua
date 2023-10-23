DevMode = Class {}

function DevMode:init(dev)
    self.active = dev or false
end

function DevMode:draw(list)
    if not self.active then
        return
    end

    for key, value in pairs(list) do
        value:drawDevMode()
    end

    love.graphics.setFont(app.fonts.small)
    love.graphics.print(tostring(state.current.pipeManager.pipeData.gapMin), 50, 100)
    love.graphics.print(tostring(state.current.pipeManager.pipeData.gapMax), 50, 110)

    love.graphics.print(tostring(state.current.levelData[state.current.level].GAP_MIN), 50, 130)
    love.graphics.print(tostring(state.current.levelData[state.current.level].GAP_MAX), 50, 140)
end
