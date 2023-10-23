require "App"

function love.load()
    app = App()
    env = Environment()

    state = StateMachine {
        ["start"] = function() return StartState() end,
        ["play"] = function() return PlayState() end,
        ["countdown"] = function() return CountdownState() end,
        ["over"] = function() return OverState() end,
        ["pause"] = function() return PauseState() end
    }

    state:change("start")

    app.audio.music:play()
    dev = DevMode()
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
