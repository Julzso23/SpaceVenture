local resources = {}

resources.images = {}

function resources.addImage(id, path)
	resources.images[id] = love.graphics.newImage('images/' .. path .. '.png')
end

return resources