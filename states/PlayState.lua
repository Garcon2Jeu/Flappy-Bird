PlayState = Class { __includes = BaseState }

function PlayState:init()
    self.bird = Bird()
end

function PlayState:update(dt)
    self.bird:update(dt)
end

function PlayState:draw()
    self.bird:draw()

    dev:draw({ self.bird, env })
end

function PlayState:enter(params) end

function PlayState:exit() end
