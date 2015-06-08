local class = require('lib.middleclass')
local Transformable = require('modules.transformable')

local loveframes = require("lib.loveframes")

local Interactable = class('Interactable', Transformable)

function Interactable:initialize(options, shape, width, height)
	Transformable.initialize(self)
	self.options = options
	self.shape = shape
	if shape == 'rectangle' then
		self.width = width
		self.height = height
	elseif shape == 'circle' then
		self.radius = width
	end
	self.state = 'idle'
end

function Interactable:update()
	local x, y = love.mouse.getX(), love.mouse.getY()
	if self.state == 'hovering' then
		self.state = 'idle'
	end
	if self.shape == 'rectangle' then
		if (x > self.position.x) and (x < self.position.x + self.width) and (y > self.position.y) and (y < self.position.y + self.height) and (self.state == 'idle') then
			self.state = 'hovering'
		end
	elseif self.shape == 'circle' then
		if (((x - self.position.x) ^ 2 + (y - self.position.y) ^ 2) < self.radius ^ 2) and (self.state == 'idle') then
			self.state = 'hovering'
		end
	end
end

function Interactable:mouseDown(button)
	if (self.state == 'hovering') and (button == 'r') then
		self.state = 'clicking'
	end
end

function Interactable:mouseUp(x, y, button)
	if (self.state == 'clicking') and (button == 'r') then
		self.state = 'idle'

		self.menu = loveframes.Create('menu')
		for k, v in pairs(self.options) do
			self.menu:AddOption(v[1], false, v[2])
		end
		self.menu:SetPos(x, y)
	end
end

return Interactable