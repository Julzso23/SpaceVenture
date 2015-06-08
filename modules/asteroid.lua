local class = require('lib.middleclass')
local Interactable = require('modules.interactable')

local Asteroid = class('Asteroid', Interactable)

function Asteroid:initialize(x, y, size)
	Interactable.initialize(self, {
		{'Excavate', function() print('mining some stuff') end},
		{'Cancel', function() end}
	}, 'circle', size)
	self:setPosition(x, y)
end

function Asteroid:draw()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.circle('fill', self.position.x, self.position.y, self.radius)
end

return Asteroid