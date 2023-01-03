local base_path = 'custom/steady_leveling/'
local config = require(base_path .. 'config')
local SKILLS = config.SKILLS
local ATTRIBUTE_CAP = config.ATTRIBUTE_CAP
local MAJOR_SKILL_UP_PER_ATTR = config.MAJOR_SKILL_UP_PER_ATTR
local MINOR_SKILL_UP_PER_ATTR = config.MINOR_SKILL_UP_PER_ATTR
local MISC_SKILL_UP_PER_ATTR = config.MISC_SKILL_UP_PER_ATTR
local GOVERNING_ATTRIBUTES = config.GOVERNING_ATTRIBUTES_BY_STRING

local class_info = require(base_path .. 'class_info')
local is_skill_major = class_info.is_skill_major
local is_skill_minor = class_info.is_skill_minor

local accessors = require(base_path .. 'accessors')
local has_plugin = accessors.has_plugin
local get_attribute = accessors.get_attribute
local set_attribute = accessors.set_attribute
local set_cached_attribute = accessors.set_cached_attribute
local get_skill = accessors.get_skill
local get_cached_skill = accessors.get_cached_skill
local set_cached_skill = accessors.set_cached_skill
local get_level_attribute_skill_increases = accessors.get_level_attribute_skill_increases
local set_level_attribute_skill_increases = accessors.set_level_attribute_skill_increases
local gradual_major_attribute_increases = accessors.gradual_major_attribute_increases
local get_gradual_major_attribute_increase = accessors.get_gradual_major_attribute_increase
local set_gradual_major_attribute_increase = accessors.set_gradual_major_attribute_increase
local gradual_minor_attribute_increases = accessors.gradual_minor_attribute_increases
local get_gradual_minor_attribute_increase = accessors.get_gradual_minor_attribute_increase
local set_gradual_minor_attribute_increase = accessors.set_gradual_minor_attribute_increase
local gradual_misc_attribute_increases = accessors.gradual_misc_attribute_increases
local get_gradual_misc_attribute_increase = accessors.get_gradual_misc_attribute_increase
local set_gradual_misc_attribute_increase = accessors.set_gradual_misc_attribute_increase

local functions = require(base_path .. 'functions')
local update_level_attribute_skill_increases = functions.update_level_attribute_skill_increases
local message_box = functions.message_box

local function message_player_attribute_up(pid, attribute, prev_val, val)
  if prev_val > val then
    message_box(pid, attribute .. " increases to " .. get_attribute(pid, attribute) .. '!')
  end
end

local function increase_major_skill_attributes(pid)
  for attribute, val in pairs(gradual_major_attribute_increases(pid)) do
    local prev_val = val

    while val >= MAJOR_SKILL_UP_PER_ATTR do
      local new = get_attribute(pid, attribute) + 1

      -- Prevent going over the cap
      if new > ATTRIBUTE_CAP then break end

      set_attribute(pid, attribute, new)
      set_cached_attribute(pid, attribute, new)
      val = val - MAJOR_SKILL_UP_PER_ATTR
    end

    message_player_attribute_up(pid, attribute, prev_val, val)
    set_gradual_major_attribute_increase(pid, attribute, val)
  end
end

local function increase_minor_skill_attributes(pid)
  for attribute, val in pairs(gradual_minor_attribute_increases(pid)) do
    local prev_val = val

    -- LATER: do more efficiently
    while val >= MINOR_SKILL_UP_PER_ATTR do
      local new = get_attribute(pid, attribute) + 1

      -- Prevent going over the cap
      if new > ATTRIBUTE_CAP then break end

      set_attribute(pid, attribute, new)
      set_cached_attribute(pid, attribute, new)
      val = val - MINOR_SKILL_UP_PER_ATTR
    end

    message_player_attribute_up(pid, attribute, prev_val, val)
    set_gradual_minor_attribute_increase(pid, attribute, val)
  end
end

local function increase_misc_skill_attributes(pid)
  for attribute, val in pairs(gradual_misc_attribute_increases(pid)) do
    local prev_val = val

    while val >= MISC_SKILL_UP_PER_ATTR do
      local new = get_attribute(pid, attribute) + 1

      -- Prevent going over the cap
      if new > ATTRIBUTE_CAP then break end

      set_attribute(pid, attribute, new)
      set_cached_attribute(pid, attribute, new)
      val = val - MISC_SKILL_UP_PER_ATTR
    end

    message_player_attribute_up(pid, attribute, prev_val, val)
    set_gradual_misc_attribute_increase(pid, attribute, val)
  end
end

local function update_cached_skill_increases(pid, skill)
  local new = get_skill(pid, skill)
  local old = get_cached_skill(pid, skill)
  local diff = new - old

  set_cached_skill(pid, skill, new)

  if diff > 0 then
    local attribute = GOVERNING_ATTRIBUTES[skill]

    if is_skill_major(pid, skill) then
      set_gradual_major_attribute_increase(pid, attribute, get_gradual_major_attribute_increase(pid, attribute) + diff)
    elseif is_skill_minor(pid, skill) then
      set_gradual_minor_attribute_increase(pid, attribute, get_gradual_minor_attribute_increase(pid, attribute) + diff)
    else
      set_gradual_misc_attribute_increase(pid, attribute, get_gradual_misc_attribute_increase(pid, attribute) + diff)
    end

    set_level_attribute_skill_increases(pid, attribute, get_level_attribute_skill_increases(pid, attribute) + diff)
  end
end

local M = {}

function M.on_skill(_, pid)
  if has_plugin(pid) then
    for _, skill in ipairs(SKILLS) do
      update_cached_skill_increases(pid, skill)
    end

    increase_major_skill_attributes(pid)
    increase_minor_skill_attributes(pid)
    increase_misc_skill_attributes(pid)

    update_level_attribute_skill_increases(pid)

    -- LATER: set health dynamic

    -- Performs the update
    Players[pid]:LoadAttributes()
  end
end

return M
