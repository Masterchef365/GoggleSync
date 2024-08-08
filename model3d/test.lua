require("model3d")
require("draw_model3d")

local neural = peripheral.wrap("back")
local canvas = neural.canvas3d()
canvas.clear()

local model = Model3d:new()
model:addLine({1,1,1},{2,2,2})
model:addBox({0, 0, 0}, {1, 2, 3}, 0xFF00FFFF)
model:addText({3, 3, 3}, "balls", 0xFF00FFFF)

local group = canvas.create({0,0,0})
drawModelToGroup(model, group)
--print(textutils.serialise(model))
