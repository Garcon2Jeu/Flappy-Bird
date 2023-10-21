PlayState = Class { __includes = BaseState }

function PlayState:init()
    bird = Bird()
end

function PlayState:update(dt)
    bird:update(dt)
end

function PlayState:draw()
    bird:draw()
end

function PlayState:enter(params) end

function PlayState:exit() end
