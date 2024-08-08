Model3d = {}

function Model3d:new()
    local model = setmetatable({}, { __index = Model3d })
    model.lines = {}
    model.boxes = {}
    model.text_shapes = {}
    return model
end

function Model3d:addLine(a, b, thickness, colour)
    self.lines[#self.lines+1] = { 
        a=a, b=b, thickness=thickness, colour=colour,
    }
end

function Model3d:addBox(pos, size, colour)
    self.boxes[#self.boxes+1] = { 
        pos=pos, size=size, colour=colour
    }
end

function Model3d:addText(pos, text, colour, size)
    self.text_shapes[#self.text_shapes+1] = { 
        pos=pos, text=text, colour=colour, size=size
    }
end