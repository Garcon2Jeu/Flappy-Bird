PipeManager = Class {}


PIPEMANAGER        = {}
PIPEMANAGER.OFFSET = 50
PIPEMANAGER.LOWEST = VIRTUAL_HEIGHT - 16 - PIPEMANAGER.OFFSET


function PipeManager:init(levelData)
    self.timer = 0

    self.pipeData = {}
    self:setPipeData(levelData)

    self.pipeData.speed = env:getGroundSpeed()
    self.pipeData.highest = PIPEMANAGER.OFFSET + self.pipeData.gapMax

    self.pipeData.nextY = math.random(PIPEMANAGER.LOWEST, self.pipeData.highest)
    self.pipeData.lastY = 0

    self.pipePairs = { self:factory(self.pipeData.nextY) }
end

function PipeManager:update(dt)
    self.timer = self.timer + dt

    self:spawnPipes()
    self:updatePipes(dt)
    self:removePipe()
end

function PipeManager:draw()
    for key, pipe in pairs(self.pipePairs) do
        pipe.top:draw()
        pipe.bottom:draw()
    end
end

function PipeManager:spawnPipes()
    if self.timer >= self.pipeData.frequence then
        self.pipeData.lastY = self.pipeData.nextY
        self.pipeData.nextY = self:generatePipeY()

        table.insert(self.pipePairs, self:factory(self.pipeData.nextY))
        self.timer = 0
    end
end

function PipeManager:factory(y)
    return {
        top    = Pipe(y - math.random(self.pipeData.gapMin, self.pipeData.gapMax)),
        bottom = Pipe(y, true),
        scored = false
    }
end

function PipeManager:updatePipes(dt)
    local pipeDX = self.pipeData.speed * dt

    for key, pipe in pairs(self.pipePairs) do
        pipe.top:update(pipeDX)
        pipe.bottom:update(pipeDX)
    end
end

function PipeManager:removePipe()
    for key, pipe in pairs(self.pipePairs) do
        if pipe.bottom:isOut() then
            table.remove(self.pipePairs, key)
        end
    end
end

function PipeManager:generatePipeY()
    return math.max(
        self.pipeData.highest,
        math.min(
            self.pipeData.lastY + math.random(-20, 20),
            PIPEMANAGER.LOWEST
        )
    )
end

-------------------------------------------------------Getters & Setters---------------------------------------------------------------------
function PipeManager:setPipeData(levelData)
    self.pipeData.frequence = levelData.FREQUENCE
    self.pipeData.gapMin = levelData.GAP_MIN
    self.pipeData.gapMax = levelData.GAP_MAX
    self.pipeData.highest = PIPEMANAGER.OFFSET + self.pipeData.gapMax
end

-------------------------------------------------------DEVMODE---------------------------------------------------------------------
function PipeManager:drawDevMode()
    for key, pipe in pairs(self.pipePairs) do
        pipe.top:drawDevMode()
        pipe.bottom:drawDevMode()
    end
end
