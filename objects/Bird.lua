Bird = Class {}


local BIRD            = {}
BIRD.SPRITE           = love.graphics.newImage("assets/images/bird.png")
BIRD.WIDTH            = BIRD.SPRITE:getWidth()
BIRD.HEIGHT           = BIRD.SPRITE:getHeight()
BIRD.GRAVITY          = 15
BIRD.JUMP_FORCE       = -3
BIRD.HITBOX_OFFSET_XY = 3
BIRD.HITBOX_OFFSET_WH = -8


function Bird:init()
    self.x      = CENTER_WIDTH - BIRD.WIDTH / 2
    self.y      = 0
    self.dy     = 0
    self.hitbox = Hitbox(BIRD.WIDTH + BIRD.HITBOX_OFFSET_WH, BIRD.HEIGHT + BIRD.HITBOX_OFFSET_WH)
end

function Bird:update(dt)
    self.dy = self:fall(dt)
    self.dy = self:jump() or self.dy

    self.y = self.y + self.dy

    self:stopOnGround()
    self.hitbox:update(self.x + BIRD.HITBOX_OFFSET_XY, self.y + BIRD.HITBOX_OFFSET_XY)
end

function Bird:draw()
    love.graphics.draw(BIRD.SPRITE, self.x, self.y)
end

function Bird:fall(dt)
    return self.dy + BIRD.GRAVITY * dt
end

function Bird:jump()
    if app:wasKeyPressed("space") then
        app.audio.jump:play()
        return BIRD.JUMP_FORCE
    end
end

function Bird:stopOnGround()
    if self.y + BIRD.HEIGHT >= VIRTUAL_HEIGHT - env:getGroundHeight() then
        self.y = VIRTUAL_HEIGHT - env:getGroundHeight() - BIRD.HEIGHT
    end

    -- if self.hitbox:collides(env.ground_hitbox) then
    --     self.y = VIRTUAL_HEIGHT - env:getGroundHeight() - BIRD.HEIGHT
    -- end
end
