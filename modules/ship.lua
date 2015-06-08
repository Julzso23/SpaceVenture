local class = require('lib.middleclass')
local Transformable = require('modules.transformable')
local images = require('modules.resources').images

local Ship = class('Ship', Transformable)

function Ship:initialize(x, y)
	Transformable.initialize(self)
	self.position.x = x
	self.position.y = y
	self.rotation = 0
end

function Ship:draw()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(images.shipBasic, self.position.x, self.position.y, self.rotation, 1, 1, images.shipBasic:getWidth() / 2, images.shipBasic:getHeight() / 2)
end

return Ship