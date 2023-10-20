require "App"

function love.load()
    app = App()
end

function love.update(dt)
    app:update(dt)
end

function love.draw()
end

function love.keypressed(key)
    app.keysPressed[key] = true
end

function love.resize(w, h)
    Push:resize(w, h)
end
