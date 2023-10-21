Environment = Class {}


local BACKGROUND         = {}
BACKGROUND.SPRITE        = love.graphics.newImage("assets/images/background.png")
BACKGROUND.WIDTH         = BACKGROUND.SPRITE:getWidth()
BACKGROUND.HEIGHT        = BACKGROUND.SPRITE:getHeight()
BACKGROUND.LOOPING_POINT = 413
BACKGROUND.SPEED         = 30


local GROUND            = {}
GROUND.SPRITE           = love.graphics.newImage("assets/images/ground.png")
GROUND.WIDTH            = GROUND.SPRITE:getWidth()
GROUND.HEIGHT           = GROUND.SPRITE:getHeight()
GROUND.Y                = VIRTUAL_HEIGHT - GROUND.HEIGHT
GROUND.SPEED            = 60
GROUND.HITBOX_OFFSET_XY = GROUND.Y - 4

function Environment:init()
    self.background_X  = 0
    self.ground_X      = 0
    self.ground_hitbox = Hitbox(GROUND.WIDTH, GROUND.HEIGHT)
end

function Environment:update(dt)
    self.background_X = (self.background_X + BACKGROUND.SPEED * dt) % BACKGROUND.LOOPING_POINT
    self.ground_X = (self.ground_X + GROUND.SPEED * dt) % VIRTUAL_WIDTH
    self.ground_hitbox:update(0, GROUND.HITBOX_OFFSET_XY)
end

function Environment:drawBackground()
    love.graphics.draw(BACKGROUND.SPRITE, -self.background_X, 0)
end

function Environment:drawGround()
    love.graphics.draw(GROUND.SPRITE, -self.ground_X, GROUND.Y)
end

function Environment:getGroundHeight()
    return GROUND.HEIGHT
end

-------------------------------------------------------DEVMODE---------------------------------------------------------------------
function Environment:drawDevMode()
    self.ground_hitbox:drawDevMode()
end
