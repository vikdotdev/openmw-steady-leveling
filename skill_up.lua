local config = require('custom/reckless/config')
local SKILLS = config.skills
local MAJOR_SKILL_UP_PER_ATTR = config.MAJOR_SKILL_UP_PER_ATTR
local MINOR_SKILL_UP_PER_ATTR = config.MINOR_SKILL_UP_PER_ATTR
local MISC_SKILL_UP_PER_ATTR = config.MISC_SKILL_UP_PER_ATTR
local GOVERNING_ATTRIBUTES = config.governing_attributes_by_string

local class_info = require('custom/reckless/class_info')
local is_skill_major = class_info.is_skill_major
local is_skill_minor = class_info.is_skill_minor

local accessors = require('custom/reckless/accessors')
local has_plugin = accessors.has_plugin
local get_attribute = accessors.get_attribute
local set_attribute = accessors.set_attribute
local set_cached_attribute = accessors.set_cached_attribute
local get_skill = accessors.get_skill
local get_cached_skill = accessors.get_cached_skill
local set_cached_skill = accessors.set_cached_skill
local get_attribute_skill_ups = accessors.get_attribute_skill_ups
local set_attribute_skill_ups = accessors.set_attribute_skill_ups
local cached_major_skill_ups = accessors.cached_major_skill_ups
local get_cached_major_skill_up = accessors.get_cached_major_skill_up
local set_cached_major_skill_up = accessors.set_cached_major_skill_up
local cached_minor_skill_ups = accessors.cached_minor_skill_ups
local get_cached_minor_skill_up = accessors.get_cached_minor_skill_up
local set_cached_minor_skill_up = accessors.set_cached_minor_skill_up
local cached_misc_skill_ups = accessors.cached_misc_skill_ups
local get_cached_misc_skill_up = accessors.get_cached_misc_skill_up
local set_cached_misc_skill_up = accessors.set_cached_misc_skill_up

local functions = require('custom/reckless/functions')
local update_attribute_skill_ups = functions.update_attribute_skill_ups
local chat_message = functions.chat_message
local message_box = functions.message_box

local function increase_attributes_from_major_skill_ups(pid)
  for attribute, val in pairs(cached_major_skill_ups(pid)) do
    while val >= MAJOR_SKILL_UP_PER_ATTR do
      local new = get_attribute(pid, attribute) + 1
      set_attribute(pid, attribute, new)
      set_cached_attribute(pid, attribute, new)
      val = val - MAJOR_SKILL_UP_PER_ATTR
    end

    set_cached_major_skill_up(pid, attribute, val)
  end
end

local function increase_attributes_from_minor_skill_ups(pid)
  for attribute, val in pairs(cached_minor_skill_ups(pid)) do
    -- TODO do more efficiently
    while val >= MINOR_SKILL_UP_PER_ATTR do
      local new = get_attribute(pid, attribute) + 1
      set_attribute(pid, attribute, new)
      set_cached_attribute(pid, attribute, new)
      val = val - MINOR_SKILL_UP_PER_ATTR
    end

    set_cached_minor_skill_up(pid, attribute, val)
  end
end

local function increase_attributes_from_misc_skill_ups(pid)
  for attribute, val in pairs(cached_misc_skill_ups(pid)) do
    while val >= MISC_SKILL_UP_PER_ATTR do
      local new = get_attribute(pid, attribute) + 1
      set_attribute(pid, attribute, new)
      set_cached_attribute(pid, attribute, new)
      val = val - MISC_SKILL_UP_PER_ATTR
    end

    set_cached_misc_skill_up(pid, attribute, val)
  end
end

local function message_skill_up(pid, attribute, current, ceiling)
  -- TODO add config
  if true then
    if current == ceiling then
      chat_message(pid, attribute .. ' increased! ' .. ' 0 out of ' .. ceiling)
    else
      chat_message(pid, current .. ' out of ' .. ceiling .. ' skill points complete to increase ' .. attribute)
    end
  end
end


local function update_cached_skill_ups(pid, skill)
  local new = get_skill(pid, skill)
  local old = get_cached_skill(pid, skill)
  local diff = new - old

  set_cached_skill(pid, skill, new)

  if diff > 0 then
    local attribute = GOVERNING_ATTRIBUTES[skill]

    if is_skill_major(pid, skill) then
      set_cached_major_skill_up(pid, attribute, get_cached_major_skill_up(pid, attribute) + diff)
      message_skill_up(pid, attribute, get_cached_major_skill_up(pid, attribute), MAJOR_SKILL_UP_PER_ATTR)
    elseif is_skill_minor(pid, skill) then
      set_cached_minor_skill_up(pid, attribute, get_cached_minor_skill_up(pid, attribute) + diff)
      message_skill_up(pid, attribute, get_cached_minor_skill_up(pid, attribute), MINOR_SKILL_UP_PER_ATTR)
    else
      set_cached_misc_skill_up(pid, attribute, get_cached_misc_skill_up(pid, attribute) + diff)
      message_skill_up(pid, attribute, get_cached_misc_skill_up(pid, attribute), MISC_SKILL_UP_PER_ATTR)
    end

    set_attribute_skill_ups(pid, attribute, get_attribute_skill_ups(pid, attribute) + diff)
  end
end

local M = {}

function M.on_skill(_, pid)
  if has_plugin(pid) then
    for _, skill in ipairs(SKILLS) do
      update_cached_skill_ups(pid, skill)
    end

    increase_attributes_from_major_skill_ups(pid)
    increase_attributes_from_minor_skill_ups(pid)
    increase_attributes_from_misc_skill_ups(pid)

    update_attribute_skill_ups(pid)

    -- TODO set health dynamic

    -- performs the update
    Players[pid]:LoadAttributes()
  end
end

return M
