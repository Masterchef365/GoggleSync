--require("model3d")
require("draw_model3d")

local neural = peripheral.wrap("back")
local canvas = neural.canvas3d()
canvas.clear()

function lorenz(pos)
    local sigma = 10.0
    local rho = 28.0
    local beta = 8.0/3.0
    return vector.new(
        sigma * (pos.y - pos.x), 
        pos.x * (rho - pos.z) - pos.y,
        pos.x * pos.y - beta * pos.z
    )
end

function runge_kutta_step(pos, step)
    local k1 = lorenz(pos) * step
    local k2 = lorenz(pos + k1 / 2.0) * step
    local k3 = lorenz(pos + k2 / 2.0) * step
    local k4 = lorenz(pos + k3) * step
    return (k1 + k2 * 2.0 + k3 * 2.0 + k4) / 6.0
end

local model = Model3d:new()

local pos = vector.new(1,1,1)
local STEP = 0.015
for i=1,10000 do
    local new_pos = pos + runge_kutta_step(pos, STEP)
    local sz = 1.0
    model:addLine(
        {new_pos.x*sz, new_pos.y*sz, new_pos.z*sz}, 
        {pos.x*sz, pos.y*sz, pos.z*sz}
    )
    pos = new_pos
end

--model:addBox({0, 0, 0}, {1, 2, 3}, 0xFF00FFFF)
--model:addText({3, 3, 3}, "balls", 0xFF00FFFF)

local group = canvas.create({0,0,0})
drawModelToGroup(model, group)
--print(textutils.serialise(model))
