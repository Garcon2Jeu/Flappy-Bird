WINDOW_WIDTH   = 1280
WINDOW_HEIGHT  = 720
VIRTUAL_WIDTH  = 512
VIRTUAL_HEIGHT = 288
CENTER_WIDTH   = VIRTUAL_WIDTH / 2
CENTER_HEIGHT  = VIRTUAL_HEIGHT / 2


Class = require "libraries.class"
Push  = require "libraries.push"

require "states.StateMachine"
require "states.BaseState"
require "states.StartState"
require "states.CountdownState"
require "states.PlayState"
require "states.OverState"
require "states.PauseState"

require "objects.Hitbox"
require "objects.Environment"
require "objects.Bird"
require "objects.PipeManager"
require "objects.Pipe"


App = Class {}

function App:init()
    math.randomseed(os.time())
    self:setWindow()

    self.fonts = self:getFonts()
    self.audio = self:getAudio()
    self.audio.music:setLooping(true)

    self.keysPressed = {}
end

function App:update(dt)
    self:quit()
    self:reset()
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

function App:getFonts()
    return {
        small  = love.graphics.newFont("assets/fonts/font.ttf", 8),
        medium = love.graphics.newFont("assets/fonts/flappy.ttf", 14),
        big    = love.graphics.newFont("assets/fonts/flappy.ttf", 28),
        huge   = love.graphics.newFont("assets/fonts/flappy.ttf", 56)
    }
end

function App:getAudio()
    return {
        explosion = love.audio.newSource("assets/audio/explosion.wav", "static"),
        go        = love.audio.newSource("assets/audio/go.wav", "static"),
        hurt      = love.audio.newSource("assets/audio/hurt.wav", "static"),
        jump      = love.audio.newSource("assets/audio/jump.wav", "static"),
        pause     = love.audio.newSource("assets/audio/pause.wav", "static"),
        score     = love.audio.newSource("assets/audio/score.wav", "static"),
        unpause   = love.audio.newSource("assets/audio/unpause.wav", "static"),
        wait      = love.audio.newSource("assets/audio/wait.wav", "static"),
        music     = love.audio.newSource("assets/audio/marios_way.mp3", "static")
    }
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

function App:reset()
    if self:wasKeyPressed("backspace") then
        love.load()
    end
end
