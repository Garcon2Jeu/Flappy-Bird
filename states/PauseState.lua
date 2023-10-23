PauseState = Class { __includes = BaseState }

function PauseState:init()
    app.audio.unpause:play()
    env.scrolling = false
    love.audio.pause(app.audio.music)
end

function PauseState:update(dt)
    if app:wasKeyPressed("p") then
        app.audio.music:play()
        app.audio.pause:play()
        env.scrolling = true
        state:switchBack("play")
    end
end

function PauseState:draw()
    self.playState:draw()

    love.graphics.setFont(app.fonts.huge)
    love.graphics.printf("PAUSE", 0, CENTER_HEIGHT - 16, VIRTUAL_WIDTH, "center")
end

function PauseState:enter(params)
    self.playState = params
end

function PauseState:exit() end
