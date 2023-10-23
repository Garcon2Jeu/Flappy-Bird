StateMachine = Class {}

function StateMachine:init(states)
    self.empty = {
        update = function() end,
        draw = function() end,
        enter = function() end,
        exit = function() end
    }
    self.states = states or {}
    self.current = self.empty
    self.placeholder = {}
end

function StateMachine:change(stateName, enterParams)
    assert(self.states[stateName])
    self.current:exit()
    self.current = self.states[stateName]()
    self.current:enter(enterParams)
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:draw()
    self.current:draw()
end

function StateMachine:switchTo(key, stateName, enterParams)
    self.placeholder[key] = self.current
    self:change(stateName, enterParams)
end

function StateMachine:switchBack(key)
    assert(self.placeholder[key])
    self.current = self.placeholder[key]
end
