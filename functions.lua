local base_path = 'custom/steady_leveling/'
local config = require(base_path .. 'config')
local ATTRIBUTES = config.ATTRIBUTES

local accessors = require(base_path .. 'accessors')
local get_attribute = accessors.get_attribute
local set_attribute = accessors.set_attribute
local set_cached_attribute = accessors.set_cached_attribute
local get_level_attribute_skill_increases = accessors.get_level_attribute_skill_increases
local set_level_attribute_skill_increases = accessors.set_level_attribute_skill_increases
local get_attribute_points_on_level = accessors.get_attribute_points_on_level
local set_attribute_points_on_level = accessors.set_attribute_points_on_level

local M = {}

local SKILLS_PER_SKILL_UP = 5

function M.update_level_attribute_skill_increases(pid)
  for _, attribute in ipairs(ATTRIBUTES) do
    local skill_up = get_level_attribute_skill_increases(pid, attribute)

    local increase = 0
    if skill_up >= SKILLS_PER_SKILL_UP then
      increase = 1 -- x2
    end

    Players[pid].data.attributes[attribute].skillIncrease = increase
  end

  Players[pid]:LoadAttributes()
end

-- LATER: only used in level up, move
-- This function relies on level_attribute_skill_increases and attribute_points_on_level
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

    while get_attribute_points_on_level(pid, attribute) > 0 and get_level_attribute_skill_increases(pid, attribute) >= SKILLS_PER_SKILL_UP do
      set_level_attribute_skill_increases(pid, attribute, get_level_attribute_skill_increases(pid, attribute) - SKILLS_PER_SKILL_UP)
      set_attribute_points_on_level(pid, attribute, get_attribute_points_on_level(pid, attribute) - 1)
      val = val + 1
    end

    if val > 0 then
      local new_val = get_attribute(pid, attribute) + val
      set_attribute(pid, attribute, new_val)
      set_cached_attribute(pid, attribute, new_val)
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

