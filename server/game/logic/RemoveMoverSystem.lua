local require = require("import")

local entitas = require("entitas")
local Components = require("Components")
local ReactiveSystem = entitas.ReactiveSystem
local Matcher = entitas.Matcher
local GroupEvent = entitas.GroupEvent

local M = class("CreateMoverSystem", ReactiveSystem)

function M:ctor(contexts, helper)
    M.super.ctor(self, contexts.input)
    self.context = contexts.game
    self.input_entity = contexts.input.input_entity
    self.idx = contexts.idx
    self.aoi = helper.aoi
end

local trigger = {
    {
        Matcher({Components.CommandRemove}),
        GroupEvent.ADDED | GroupEvent.UPDATE
    }
}

function M:get_trigger()
    return trigger
end

function M:filter(entity)
    return entity:has(Components.CommandRemove)
end

function M:execute()
    local cmd = self.input_entity:get(Components.CommandRemove)

    local e = self.idx:get_entity(cmd.id)
    if e then
        self.aoi.erase(cmd.id,true)
        self.aoi.update_message()
        self.context:destroy_entity(e)
    end

    --print("remove mover", cmd.id)
end

return M
