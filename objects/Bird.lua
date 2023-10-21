Bird = Class {}


local BIRD   = {}
BIRD.SPRITE  = love.graphics.newImage("assets/images/bird.png")
BIRD.WIDTH   = BIRD.SPRITE:getWidth()
BIRD.HEIGHT  = BIRD.SPRITE:getHeight()
BIRD.GRAVITY = 10


function Bird:init()
    self.x  = CENTER_WIDTH - BIRD.WIDTH / 2
    self.y  = CENTER_HEIGHT - BIRD.HEIGHT / 2
    self.dy = 0
end

function Bird:update(dt)
    self.y = self:fall(dt)
end

function Bird:draw()
    love.graphics.draw(BIRD.SPRITE, self.x, self.y)
end

function Bird:fall(dt)
    self.dy = self.dy + BIRD.GRAVITY * dt
    return self.y + self.dy
end
