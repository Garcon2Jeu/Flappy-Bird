Pipe = Class {}


local PIPE  = {}
PIPE.SPRITE = love.graphics.newImage("assets/images/pipe.png")
PIPE.WIDTH  = PIPE.SPRITE:getWidth()
PIPE.HEIGHT = PIPE.SPRITE:getHeight()
PIPE.GAP    = 120


function Pipe:init()
    self.speed  = env:getGroundSpeed()
    self.x      = VIRTUAL_WIDTH
    self.y      = CENTER_HEIGHT
    self.dx     = 0
    self.hitbox = Hitbox(PIPE.WIDTH, PIPE.HEIGHT)
end

function Pipe:update(dt)
    self.dx = self.speed * dt
    self.x = self.x - self.dx
    self.hitbox:update(self.x, self.y)
end

function Pipe:draw()
    love.graphics.draw(PIPE.SPRITE, self.x, self.y)
end

function Pipe:drawDevMode()
    self.hitbox:drawDevMode()
end
