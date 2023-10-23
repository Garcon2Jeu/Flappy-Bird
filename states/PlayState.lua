PlayState = Class { __includes = BaseState }


local LEVEL_1     = {}
LEVEL_1.GOAL      = 3
LEVEL_1.FREQUENCE = 4
LEVEL_1.GAP_MIN   = 120
LEVEL_1.GAP_MAX   = 120

local LEVEL_2     = {}
LEVEL_2.GOAL      = 6
LEVEL_2.FREQUENCE = 3
LEVEL_2.GAP_MIN   = 80
LEVEL_2.GAP_MAX   = 100

local LEVEL_3     = {}
LEVEL_3.GOAL      = 9
LEVEL_3.FREQUENCE = 2
LEVEL_3.GAP_MIN   = 60
LEVEL_3.GAP_MAX   = 100


function PlayState:init()
    self.name        = "play"
    self.levelData   = { LEVEL_1, LEVEL_2, LEVEL_3 }
    self.level       = 1
    self.score       = 0
    self.bird        = Bird()
    self.pipeManager = PipeManager(self.levelData[1])
end

function PlayState:update(dt)
    self:pause()

    self.bird:update(dt)
    self.pipeManager:update(dt, self.levelData)

    self:scoring()
    self:levelUp()

    if self:hasPlayerLost() then
        state:change("over", {
            score = self.score,
            level = self.level
        })
    end
end

function PlayState:draw()
    self.bird:draw()
    self.pipeManager:draw()

    love.graphics.setFont(app.fonts.big)
    love.graphics.print("Level " .. tostring(self.level), 10, 10)
    love.graphics.print("Score = " .. tostring(self.score), 10, 40)

    dev:draw({ env, self.bird, self.pipeManager })
end

function PlayState:enter(params) end

function PlayState:exit() end

function PlayState:pause()
    if app:wasKeyPressed("p") then
        state:switchTo("play", "pause", self)
    end
end

function PlayState:scoring()
    for key, pipe in pairs(self.pipeManager.pipePairs) do
        if self.bird.x > pipe.bottom.hitbox.right
            and not pipe.scored then
            self.score = self.score + 1
            pipe.scored = true
            app.audio.score:play()
        end
    end
end

function PlayState:levelUp()
    if self.level == 3 then
        return
    end

    if self.score == self.levelData[self.level].GOAL then
        self.level = self.level + 1
        self.pipeManager:setPipeData(self.levelData[self.level])
    end
end

function PlayState:hasPlayerLost()
    for key, pipe in pairs(self.pipeManager.pipePairs) do
        if pipe.bottom.hitbox:collides(self.bird.hitbox)
            or pipe.top.hitbox:collides(self.bird.hitbox) then
            app.audio.explosion:play()
            app.audio.hurt:play()
            return true
        end
    end

    if env.ground_hitbox:collides(self.bird.hitbox) then
        app.audio.explosion:play()
        app.audio.hurt:play()
        return true
    end

    return false
end
