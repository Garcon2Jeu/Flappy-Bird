OverState = Class { __includes = BaseState }

local MEDALS = {}
MEDALS.BRONZE = love.graphics.newImage("assets/images/bronze.png")
MEDALS.SILVER = love.graphics.newImage("assets/images/silver.png")
MEDALS.GOLD = love.graphics.newImage("assets/images/gold.png")

local POSITION = {}
POSITION.WIDTH = MEDALS.GOLD:getWidth()
POSITION.HEIGHT = MEDALS.GOLD:getHeight()
POSITION.X = CENTER_WIDTH - POSITION.WIDTH / 4 - 50
POSITION.Y = CENTER_HEIGHT - POSITION.HEIGHT / 4


function OverState:init() end

function OverState:update(dt)
    if app:wasKeyPressed("return") then
        state:change("start")
    end
end

function OverState:draw()
    love.graphics.setFont(app.fonts.big)
    love.graphics.printf("Game Over", 0, CENTER_HEIGHT - 75, VIRTUAL_WIDTH, "center")

    love.graphics.setFont(app.fonts.medium)
    love.graphics.draw(self.medal, POSITION.X, POSITION.Y, 0, .5, .5)
    love.graphics.printf("Level = " .. tostring(self.level), 25, CENTER_HEIGHT - 20, VIRTUAL_WIDTH, "center")
    love.graphics.printf("Score = " .. self.score, 25, CENTER_HEIGHT + 10, VIRTUAL_WIDTH, "center")

    love.graphics.printf("Press Return to Play again", 0, CENTER_HEIGHT + 50, VIRTUAL_WIDTH, "center")
end

function OverState:enter(params)
    self.score = tostring(params.score)
    self.level = params.level

    if self.level == 1 then
        self.medal = MEDALS.BRONZE
    elseif self.level == 2 then
        self.medal = MEDALS.SILVER
    elseif self.level == 3 then
        self.medal = MEDALS.GOLD
    end
end

function OverState:exit() end
