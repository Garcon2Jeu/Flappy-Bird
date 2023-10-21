PlayState = Class { __includes = BaseState }

function PlayState:init()
    self.bird = Bird()
    self.pipeManager = PipeManager()
    self.score = 0
end

function PlayState:update(dt)
    self.bird:update(dt)
    self.pipeManager:update(dt)

    self:scoring()

    if self:hasPlayerLost() then
        state:change("over", self.score)
    end
end

function PlayState:draw()
    self.bird:draw()
    self.pipeManager:draw()

    love.graphics.print("Score = " .. tostring(self.score), 10, 10)

    dev:draw({ env, self.bird, self.pipeManager })
end

function PlayState:enter(params) end

function PlayState:exit() end

function PlayState:scoring()
    for key, pipe in pairs(self.pipeManager.pipePairs) do
        if self.bird.x > pipe.bottom.hitbox.right
            and not pipe.scored then
            self.score = self.score + 1
            pipe.scored = true
        end
    end
end

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
