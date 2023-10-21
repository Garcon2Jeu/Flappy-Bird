PlayState = Class { __includes = BaseState }

function PlayState:init()
    self.bird = Bird()
    self.pipe = Pipe()
end

function PlayState:update(dt)
    self.bird:update(dt)
    self.pipe:update(dt)
end

function PlayState:draw()
    self.bird:draw()
    self.pipe:draw()

    dev:draw({ env, self.bird, self.pipe })
end

function PlayState:enter(params) end

function PlayState:exit() end
