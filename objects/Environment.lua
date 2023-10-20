Environment = Class {}


local BACKGROUND         = {}
BACKGROUND.SPRITE        = love.graphics.newImage("assets/images/background.png")
BACKGROUND.WIDTH         = BACKGROUND.SPRITE:getWidth()
BACKGROUND.HEIGHT        = BACKGROUND.SPRITE:getHeight()
BACKGROUND.LOOPING_POINT = 413
BACKGROUND.SPEED         = 30


local GROUND  = {}
GROUND.SPRITE = love.graphics.newImage("assets/images/ground.png")
GROUND.WIDTH  = GROUND.SPRITE:getWidth()
GROUND.HEIGHT = GROUND.SPRITE:getHeight()
GROUND.Y      = VIRTUAL_HEIGHT - GROUND.HEIGHT
GROUND.SPEED  = 60

function Environment:init()
    self.background_X = 0
    self.ground_X     = 0
end

function Environment:drawBackground()
    love.graphics.draw(BACKGROUND.SPRITE, 0, 0)
end

function Environment:drawGround()
    love.graphics.draw(GROUND.SPRITE, 0, GROUND.Y)
end
