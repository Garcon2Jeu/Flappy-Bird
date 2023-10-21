Hitbox = Class {}

function Hitbox:init(width, height)
    self.width  = width
    self.height = height

    self.left   = 0
    self.right  = 0
    self.top    = 0
    self.bottom = 0
end

function Hitbox:update(x, y)
    self.left   = x
    self.right  = x + self.width
    self.top    = y
    self.bottom = y + self.height
end

function Hitbox:drawDevMode()
    love.graphics.rectangle("line", self.left, self.top, self.width, self.height)
end
