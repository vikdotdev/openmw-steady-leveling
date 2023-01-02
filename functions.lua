local config = require('custom/reckless/config')
local ATTRIBUTES = config.attributes

local accessors = require('custom/reckless/accessors')
local get_attribute = accessors.get_attribute
local set_attribute = accessors.set_attribute
local set_cached_attribute = accessors.set_cached_attribute
local get_attribute_skill_ups = accessors.get_attribute_skill_ups
local set_attribute_skill_ups = accessors.set_attribute_skill_ups
local get_attribute_points_on_level = accessors.get_attribute_points_on_level
local set_attribute_points_on_level = accessors.set_attribute_points_on_level

local M = {}

local SKILLS_PER_SKILL_UP = 5

-- TODO rename ups to increases
function M.update_attribute_skill_ups(pid)
  for _, attribute in ipairs(ATTRIBUTES) do
    local skill_up = get_attribute_skill_ups(pid, attribute)

    local increase = 0
    if skill_up >= SKILLS_PER_SKILL_UP then
      increase = 1 -- x2
    end

    Players[pid].data.attributes[attribute].skillIncrease = increase
    -- TODO remove
    if increase > 0 then
      M.chat_message(pid, attribute .. " skill up increased to " .. increase)
    end
  end

  Players[pid]:LoadAttributes()
end

-- This function relies on attribute_skill_ups and attribute_points_on_level
-- being set beforehand, subtracts those values if there's enough points and
-- performs an update.
function M.increase_attributes(pid)
  for _, attribute in ipairs(ATTRIBUTES) do
    local val = 0

    -- Only apply x1 to selected attributes
    if get_attribute_points_on_level(pid, attribute) > 0 then
      val = 1

      -- Remove that 1 point from points_on_level
      set_attribute_points_on_level(pid, attribute, get_attribute_points_on_level(pid, attribute) - 1)
    end

    while get_attribute_points_on_level(pid, attribute) > 0 and get_attribute_skill_ups(pid, attribute) >= SKILLS_PER_SKILL_UP do
      set_attribute_skill_ups(pid, attribute, get_attribute_skill_ups(pid, attribute) - SKILLS_PER_SKILL_UP)
      set_attribute_points_on_level(pid, attribute, get_attribute_points_on_level(pid, attribute) - 1)
      val = val + 1
    end

    if val > 0 then
      local new_val = get_attribute(pid, attribute) + val
      set_attribute(pid, attribute, new_val)
      set_cached_attribute(pid, attribute, new_val)
      M.message_box(pid, attribute .. " " .. "increased to " .. new_val)
    end
  end

  Players[pid]:LoadAttributes()
end

function M.message_box(pid, msg)
  tes3mp.MessageBox(pid, -1, msg)
end

function M.chat_message(pid, msg)
  tes3mp.SendMessage(pid, 'Reckless Leveling: ' .. msg .. '\n')
end

return M

