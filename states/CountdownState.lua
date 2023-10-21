CountdownState = Class { __includes = BaseState }

function CountdownState:init()
    self.count = 3
    self.step  = 1
    self.timer = 0
end

function CountdownState:update(dt)
    self.timer = (self.timer + dt)

    if self.timer > self.step then
        self.timer = self.timer % self.step
        self.count = self.count - 1
    end

    if self.count == 0 then
        state:change("play")
    end
end

function CountdownState:draw()
    love.graphics.setFont(app.fonts.big)
    love.graphics.printf(tostring(self.count), 0, CENTER_HEIGHT, VIRTUAL_WIDTH, "center")
end

function CountdownState:enter(params) end

function CountdownState:exit() end
