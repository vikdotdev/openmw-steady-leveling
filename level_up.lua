local config = require('custom/reckless/config')
local ATTRIBUTES = config.attributes
local ATTRIBUTES_NO_LUCK = config.attributes_no_luck

local accessors = require('custom/reckless/accessors')
local has_plugin = accessors.has_plugin
local get_current_level = accessors.get_current_level
local get_cached_level = accessors.get_cached_level
local set_cached_level = accessors.set_cached_level
local get_attribute = accessors.get_attribute
local set_attribute = accessors.set_attribute
local cache_attributes = accessors.cache_attributes
local get_cached_attribute = accessors.get_cached_attribute
local get_attribute_points_on_level = accessors.get_attribute_points_on_level
local set_attribute_points_on_level = accessors.set_attribute_points_on_level

local functions = require('custom/reckless/functions')
local increase_attributes = functions.increase_attributes
local update_attribute_skill_ups = functions.update_attribute_skill_ups

local function is_level_increased(pid)
  return get_current_level(pid) > get_cached_level(pid)
end


local function increment_cached_level(pid)
  set_cached_level(pid, get_cached_level(pid) + 1)
end

local function is_attribute_selected_on_level_up(pid, attribute)
  return get_attribute(pid, attribute) > get_cached_attribute(pid, attribute)
end

local function attribute_selected_on_level_up_points(pid, attribute)
  return get_attribute(pid, attribute) - get_cached_attribute(pid, attribute)
end

local function is_attribute_selected_on_level_up_below_ceiling(pid, attribute, points)
  -- TODO constantize?
  local attribute_ceiling = 100
  return get_attribute(pid, attribute) + get_attribute_points_on_level(pid, attribute) + points <= attribute_ceiling
end

local M = {}

-- TODO test if I'll be able to get up to 100 attribute safely
function M.on_level(_, pid)
  if has_plugin(pid) then
    if is_level_increased(pid) then
      increment_cached_level(pid)

      -- no luck breaks luck? yes
      for _, attribute in ipairs(ATTRIBUTES_NO_LUCK) do
        if is_attribute_selected_on_level_up(pid, attribute) then
          -- at always adds 1 point
          local points = attribute_selected_on_level_up_points(pid, attribute)
          functions.chat_message(pid, "POINTS for " .. attribute .. ' - ' .. points)
          if is_attribute_selected_on_level_up_below_ceiling(pid, attribute, points) then
            set_attribute_points_on_level(pid, attribute, get_attribute_points_on_level(pid, attribute) + points)
            -- TODO else set to ceiling ???
          end
        end
      end

      -- restores attributes back to their pre-level values to set them
      -- later with `increase_attributes/1'
      for _, attribute in ipairs(ATTRIBUTES) do
        set_attribute(pid, attribute, get_cached_attribute(pid, attribute))
      end

      -- increase attributes based on attribute_points_on_level
      increase_attributes(pid)

      -- resets leveling skill increases
      update_attribute_skill_ups(pid)

      -- TODO recalculate health
    else
      cache_attributes(pid)
    end
  end
end

return M
