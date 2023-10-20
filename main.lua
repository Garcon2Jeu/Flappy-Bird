require "App"

function love.load()
    app = App()
    env = Environment()
end

function love.update(dt)
    app:update(dt)
    env:update(dt)
end

function love.draw()
    Push:start()
    env:drawBackground()
    env:drawGround()
    Push:finish()
end

function love.keypressed(key)
    app.keysPressed[key] = true
end

function love.resize(w, h)
    Push:resize(w, h)
end
