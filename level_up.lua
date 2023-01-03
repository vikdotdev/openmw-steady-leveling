local base_path = 'custom/steady_leveling/'
local config = require(base_path .. 'config')
local ATTRIBUTES = config.ATTRIBUTES
local ATTRIBUTE_CAP = config.ATTRIBUTE_CAP

local accessors = require(base_path .. 'accessors')
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

local functions = require(base_path .. 'functions')
local increase_attributes = functions.increase_attributes
local update_level_attribute_skill_increases = functions.update_level_attribute_skill_increases

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

local function is_attribute_selected_on_level_up_below_cap(pid, attribute, points)
  return get_attribute(pid, attribute) + get_attribute_points_on_level(pid, attribute) + points <= ATTRIBUTE_CAP
end

local M = {}

function M.on_level(_, pid)
  if has_plugin(pid) then
    if is_level_increased(pid) then
      increment_cached_level(pid)

      for _, attribute in ipairs(ATTRIBUTES) do
        if is_attribute_selected_on_level_up(pid, attribute) then
          local points = attribute_selected_on_level_up_points(pid, attribute)
          if is_attribute_selected_on_level_up_below_cap(pid, attribute, points) then
            set_attribute_points_on_level(pid, attribute, get_attribute_points_on_level(pid, attribute) + points)
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
      update_level_attribute_skill_increases(pid)

      -- LATER: recalculate health
    else
      cache_attributes(pid)
    end
  end
end

return M
