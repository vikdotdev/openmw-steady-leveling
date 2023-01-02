local config = require('custom/reckless/config')
local attributes = config.attributes
local skills = config.skills
local governing_attributes = config.governing_attributes
local attribute_default_bonuses = config.attribute_default_bonuses

local RELE = {}

local function has_rele(pid)
  return Players[pid].data.customVariables.RELE ~= nil
end

local function get_current_level(pid)
  return Players[pid].data.stats.level
end

local function get_cached_level(pid)
  return Players[pid].data.customVariables.RELE.cached_level
end

local function set_cached_level(pid, val)
  Players[pid].data.customVariables.RELE.cached_level = val
end

local function get_attribute(pid, attribute)
  return Players[pid].data.attributes[attribute].base
end

local function set_attribute(pid, attribute, val)
  Players[pid].data.attributes[attribute].base = val
end

local function get_cached_attribute(pid, attribute)
  return Players[pid].data.customVariables.RELE.cached_attributes[attribute]
end

local function get_skill(pid, skill)
  return Players[pid].data.skills[skill].base
end

local function get_cached_skill(pid, skill)
  return Players[pid].data.customVariables.RELE.cached_skills[skill]
end

local function set_cached_skill(pid, skill, val)
  Players[pid].data.customVariables.RELE.cached_skills[skill] = val
end

local function cache_attributes(pid)
  for _, attribute in ipairs(attributes) do
    Players[pid].data.customVariables.RELE.cached_attributes[attribute] = get_attribute(pid, attribute)
  end
end

local function cache_skills(pid)
  for _, skill in ipairs(skills) do
    Players[pid].data.customVariables.RELE.cached_skills[skill] = get_skill(pid, skill)
  end
end

local function get_attribute_skill_ups(pid, attribute)
  return Players[pid].data.customVariables.RELE.attribute_skill_ups[attribute]
end

local function add_attribute_skill_ups(pid, attribute, val)
  local new_value = Players[pid].data.customVariables.RELE.attribute_skill_ups[attribute] + val
  Players[pid].data.customVariables.RELE.attribute_skill_ups[attribute] = new_value
end

local function update_cached_skill(pid, skill)
  local new = get_skill(pid, skill)
  local old = get_cached_skill(pid, skill)
  local diff = new - old
  set_cached_skill(pid, skill, new)
  if diff > 0 then
    local attribute = governing_attributes[skill]
    add_attribute_skill_ups(pid, attribute, diff)
  end
end

local function update_attribute_bonuses(pid)
  for _, attribute in ipairs(attributes) do
    local skill_ups = get_attribute_skill_ups(pid, attribute)

    local bonus = attribute_default_bonuses[attribute]
    if skill_ups >= 10 then
      bonus = 10
    elseif skill_ups >= 8 then
      bonus = 8
    elseif skill_ups >= 6 then
      bonus = 5
    end

    -- TODO check if minor or major and add on top of default x2

    Players[pid].data.attributes[attribute].skillIncrease = bonus
    Players[pid]:LoadAttributes()
  end
end


function RELE.init_player(_, pid)
  local data = {
    attribute_skill_ups = {},
    cached_level = get_current_level(pid),
    cached_attributes = {},
    cached_skills = {},
  }

  for _, attribute in ipairs(attributes) do
    data.attribute_skill_ups[attribute] = 0
  end

  Players[pid].data.customVariables.RELE = data

  cache_attributes(pid)
  cache_skills(pid)

  tes3mp.SendMessage(pid, "Reckless Leveling: INITIALIZED" .. '\n')
end

function RELE.on_skill(_, pid)
  if has_rele(pid) then
    for _, skill in ipairs(skills) do
      update_cached_skill(pid, skill)
    end

    update_attribute_bonuses(pid)
  end
end

function RELE.on_level(_, pid)
  if has_rele(pid) then
    if get_current_level(pid) > get_cached_level(pid) then
      set_cached_level(pid, get_cached_level(pid))

      for _, attribute in ipairs(attributes) do
        set_attribute(pid, attribute, get_cached_attribute(pid, attribute))
      end

      update_attribute_bonuses(pid)
    else
      cache_attributes(pid)
    end
  end
end

customEventHooks.registerHandler('OnPlayerEndCharGen', RELE.init_player)
customEventHooks.registerHandler('OnPlayerLevel', RELE.on_level)
customEventHooks.registerHandler('OnPlayerSkill', RELE.on_skill)

