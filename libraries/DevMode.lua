DevMode = Class {}

function DevMode:init(dev)
    self.active = dev or false
end

function DevMode:draw(list)
    if not self.active then
        return
    end

    for key, value in pairs(list) do
        value:drawDevMode()
    end
end
