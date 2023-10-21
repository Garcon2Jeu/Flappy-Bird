Bird = Class {}


local BIRD  = {}
BIRD.SPRITE = love.graphics.newImage("assets/images/bird.png")
BIRD.WIDTH  = BIRD.SPRITE:getWidth()
BIRD.HEIGHT = BIRD.SPRITE:getHeight()


function Bird:init()
    self.x = CENTER_WIDTH - BIRD.WIDTH / 2
    self.y = CENTER_HEIGHT - BIRD.HEIGHT / 2
end

function Bird:draw()
    love.graphics.draw(BIRD.SPRITE, self.x, self.y)
end
