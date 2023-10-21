Pipe = Class {}


local PIPE  = {}
PIPE.SPRITE = love.graphics.newImage("assets/images/pipe.png")
PIPE.WIDTH  = PIPE.SPRITE:getWidth()
PIPE.HEIGHT = PIPE.SPRITE:getHeight()


function Pipe:init(y, bottom)
    self.bottom = bottom or false
    self.x      = VIRTUAL_WIDTH
    self.y      = y
    self.sy     = bottom and 1 or -1
    self.hitbox = Hitbox(PIPE.WIDTH, PIPE.HEIGHT)
end

function Pipe:update(dx)
    self.x = self.x - dx
    self.hitbox:update(self.x, self.y)
end

function Pipe:draw()
    love.graphics.draw(PIPE.SPRITE, self.x, self.y, 0, 1, self.sy)
end

function Pipe:drawDevMode()
    self.hitbox:drawDevMode()
end

function Pipe:isOut()
    return self.x <= -PIPE.WIDTH
end
