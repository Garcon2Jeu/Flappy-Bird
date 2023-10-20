WINDOW_WIDTH   = 1280
WINDOW_HEIGHT  = 720
VIRTUAL_WIDTH  = 413
VIRTUAL_HEIGHT = 288
CENTER_WIDTH   = WINDOW_WIDTH / 2
CENTER_HEIGHT  = WINDOW_HEIGHT / 2


Class = require "libraries.class"
Push  = require "libraries.push"


App = Class {}

function App:init()
    math.randomseed(os.time())
    self:setWindow()

    self.keysPressed = {}
end

function App:update(dt)
    self:quit()
    self:flushKeys()
end

function App:draw()
end

function App:setWindow()
    love.window.setTitle("Bird-Project")
    love.graphics.setDefaultFilter("nearest", "nearest")
    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })
end

function App:wasKeyPressed(key)
    return self.keysPressed[key]
end

function App:flushKeys()
    self.keysPressed = {}
end

function App:quit()
    if self:wasKeyPressed("escape") then
        love.event.quit()
    end
end
