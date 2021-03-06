local MakeComponent = require("entitas").MakeComponent

local M = {
    CommandCreate = MakeComponent("CommandCreate","id","data"),
    CommandRemove = MakeComponent("CommandRemove","id"),
    CommandMove = MakeComponent("CommandMove","id","data"),
    CommandUpdate = MakeComponent("CommandUpdate","delta"),
    InputCreateFood = MakeComponent("InputCreateFood","count"),

    BaseData = MakeComponent("BaseData","id","name","spriteid"),
    Position = MakeComponent("Position","x","y"),
    Direction = MakeComponent("Direction","x","y"),
    Speed = MakeComponent("Speed","value"),
    Color = MakeComponent("Color","r","g","b"),
    Mover = MakeComponent("Mover"),
    Food = MakeComponent("Food"),
    Radius =  MakeComponent("Radius","value"),
    Dead =  MakeComponent("Dead"),
    Eat =  MakeComponent("Eat","weight")
}

return M