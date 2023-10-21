Pipe = Class {}


local PIPE  = {}
PIPE.SPRITE = love.graphics.newImage("assets/images/pipe.png")
PIPE.WIDTH  = PIPE.SPRITE:getWidth()
PIPE.HEIGHT = PIPE.SPRITE:getHeight()
PIPE.GAP    = 120


function Pipe:init(y, bottom)
    self.position = bottom and "bottom" or "top"
    self.x        = VIRTUAL_WIDTH
    self.y        = bottom and y or y - PIPE.GAP
    self.sy       = bottom and 1 or -1
    self.hitbox   = Hitbox(PIPE.WIDTH, PIPE.HEIGHT)
end

function Pipe:update(dt, dx)
    self.x = self.x - dx
    self.hitbox:update(self.x, self.y)
end

function Pipe:draw()
    love.graphics.draw(PIPE.SPRITE, self.x, self.y, 0, 1, self.sy)
end

function Pipe:drawDevMode()
    self.hitbox:drawDevMode()
end
