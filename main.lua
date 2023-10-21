require "App"

function love.load()
    app = App()
    env = Environment()

    state = StateMachine {
        ["start"] = function() return StartState() end,
        ["play"] = function() return PlayState() end
    }

    state:change("start")
end

function love.update(dt)
    env:update(dt)
    state:update(dt)
    app:update(dt)
end

function love.draw()
    Push:start()
    env:drawBackground()
    state:draw()
    env:drawGround()
    Push:finish()
end

function love.keypressed(key)
    app.keysPressed[key] = true
end

function love.resize(w, h)
    Push:resize(w, h)
end
