PlayState = Class { __includes = BaseState }

function PlayState:init()
    self.bird = Bird()
    self.pipeManager = PipeManager()
end

function PlayState:update(dt)
    self.bird:update(dt)
    self.pipeManager:update(dt)

    if self:hasPlayerLost() then
        state:change("over")
    end
end

function PlayState:draw()
    self.bird:draw()
    self.pipeManager:draw()

    dev:draw({ env, self.bird, self.pipeManager })
end

function PlayState:enter(params) end

function PlayState:exit() end

function PlayState:hasPlayerLost()
    for key, pipe in pairs(self.pipeManager.pipePairs) do
        if pipe.bottom.hitbox:collides(self.bird.hitbox)
            or pipe.top.hitbox:collides(self.bird.hitbox) then
            return true
        end
    end

    if env.ground_hitbox:collides(self.bird.hitbox) then
        return true
    end

    return false
end
