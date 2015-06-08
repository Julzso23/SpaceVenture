function love.load(args)
	loveframes = require("lib.loveframes")

	require('modules.images')

	local Ship = require('modules.ship')

	ship = Ship:new(love.window.getWidth() / 2, love.window.getHeight() / 2)

	local Asteroid = require('modules.asteroid')

	asteroid = Asteroid:new(512, 512, 16)
end

function love.update(dt)
	loveframes.update(dt)

	asteroid:update()
end

function love.draw()
	ship:draw()

	asteroid:draw()

	loveframes.draw()
end

function love.mousepressed(x, y, button)
	loveframes.mousepressed(x, y, button)

	asteroid:mouseDown(button)
end

function love.mousereleased(x, y, button)
	loveframes.mousereleased(x, y, button)

	asteroid:mouseUp(x, y, button)
end

function love.keypressed(key, unicode)
	loveframes.keypressed(key, unicode)
end

function love.keyreleased(key)
	loveframes.keyreleased(key)
end

function love.textinput(text)
	loveframes.textinput(text)
end