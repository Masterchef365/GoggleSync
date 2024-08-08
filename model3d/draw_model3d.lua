require("model3d")

function drawModelToGroup(model, group)
    for i,v in ipairs(model.lines) do
        group.addLine(v.a, v.b, v.thickness, v.colour)
    end

    for i,v in ipairs(model.boxes) do
        group.addBox(
            v.pos[1], v.pos[2], v.pos[3],
            v.size[1], v.size[2], v.size[3],
            v.colour
        )
    end

    for i,v in ipairs(model.text_shapes) do
        local frame = group.addFrame(v.pos)
        frame.addText({0,0}, v.text, v.colour, v.size)
    end
end

