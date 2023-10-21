PlayState = Class { __includes = BaseState }

function PlayState:init()
    self.bird = Bird()
    self.pipeManager = PipeManager()
end

function PlayState:update(dt)
    self.bird:update(dt)
    self.pipeManager:update(dt)
end

function PlayState:draw()
    self.bird:draw()
    self.pipeManager:draw()

    dev:draw({ env, self.bird, self.pipe })
end

function PlayState:enter(params) end

function PlayState:exit() end
