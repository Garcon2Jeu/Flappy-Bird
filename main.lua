require "App"

function love.load()
    app = App()
    environment = Environment()
end

function love.update(dt)
    app:update(dt)
end

function love.draw()
    Push:start()
    environment:drawBackground()
    environment:drawGround()
    Push:finish()
end

function love.keypressed(key)
    app.keysPressed[key] = true
end

-- function love.resize(w, h)
--     Push:resize(w, h)
-- end
