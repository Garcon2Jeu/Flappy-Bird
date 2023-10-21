PipeManager = Class {}

function PipeManager:init()
    self.timer     = 0
    self.stopper   = 2
    self.pipes     = {}
    self.pipeSpeed = env:getGroundSpeed()
end

function PipeManager:update(dt)
    self.timer = self.timer + dt

    self:spawnPipes()
    self:updatePipes(dt)
end

function PipeManager:draw()
    for key, pipe in pairs(self.pipes) do
        pipe.top:draw()
        pipe.bottom:draw()
    end
end

function PipeManager:factory()
    return {
        top    = Pipe(CENTER_HEIGHT),
        bottom = Pipe(CENTER_HEIGHT, true)
    }
end

function PipeManager:spawnPipes()
    if self.timer >= self.stopper then
        table.insert(self.pipes, self:factory())
        self.timer = 0
    end
end

function PipeManager:updatePipes(dt)
    local pipeDX = self.pipeSpeed * dt
    for key, pipe in pairs(self.pipes) do
        pipe.top:update(dt, pipeDX)
        pipe.bottom:update(dt, pipeDX)
    end
end
