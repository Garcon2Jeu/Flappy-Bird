PipeManager = Class {}


PIPEMANAGER         = {}
PIPEMANAGER.GAP     = 120
PIPEMANAGER.OFFSET  = 50
PIPEMANAGER.HIGHEST = PIPEMANAGER.OFFSET + PIPEMANAGER.GAP
PIPEMANAGER.LOWEST  = VIRTUAL_HEIGHT - 16 - PIPEMANAGER.OFFSET


function PipeManager:init()
    self.timer     = 0
    self.stopper   = 2
    self.nextY     = math.random(PIPEMANAGER.LOWEST, PIPEMANAGER.HIGHEST)
    self.lastY     = math.random(PIPEMANAGER.LOWEST, PIPEMANAGER.HIGHEST)
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

function PipeManager:spawnPipes()
    if self.timer >= self.stopper then
        self.lastY = self.nextY
        self.nextY = self:getPipeY()

        table.insert(self.pipes, self:factory(self.nextY))
        self.timer = 0
    end
end

function PipeManager:factory(y)
    return {
        top    = Pipe(y - PIPEMANAGER.GAP),
        bottom = Pipe(y, true)
    }
end

function PipeManager:updatePipes(dt)
    local pipeDX = self.pipeSpeed * dt

    for key, pipe in pairs(self.pipes) do
        pipe.top:update(pipeDX)
        pipe.bottom:update(pipeDX)
    end
end

function PipeManager:getPipeY()
    return math.max(
        PIPEMANAGER.HIGHEST,
        math.min(
            self.lastY + math.random(-20, 20),
            PIPEMANAGER.LOWEST
        )
    )
end
