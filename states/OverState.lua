OverState = Class { __includes = BaseState }

local MEDIALS = {}
MEDIALS.BRONZE = love.graphics.newImage("assets/images/bronze.png")
MEDIALS.SILVER = love.graphics.newImage("assets/images/silver.png")
MEDIALS.GOLD = love.graphics.newImage("assets/images/gold.png")

function OverState:init() end

function OverState:update(dt)
    if app:wasKeyPressed("return") then
        state:change("start")
    end
end

function OverState:draw()
    love.graphics.setFont(app.fonts.big)
    love.graphics.printf("Game Over", 0, CENTER_HEIGHT - 100, VIRTUAL_WIDTH, "center")
    love.graphics.setFont(app.fonts.medium)
    love.graphics.printf("Score = " .. self.score, 0, CENTER_HEIGHT - 50, VIRTUAL_WIDTH, "center")
    love.graphics.printf("Press Return to Play again", 0, CENTER_HEIGHT, VIRTUAL_WIDTH, "center")
end

function OverState:enter(params)
    self.score = tostring(params.score)
    self.level = params.level
end

function OverState:exit() end

--   When a player enters the ScoreState, award them a “medal” via an image displayed along with the score;
--  this can be any image or any type of medal you choose (e.g., ribbons, actual medals, trophies, etc.), so
--  long as each is different and based on the points they scored that life. Choose 3 different ones, as well
--  as the minimum score needed for each one (though make it fair and not too hard to test :)).
