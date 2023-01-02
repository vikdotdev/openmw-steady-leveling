local config = require('custom/reckless/config')
local ATTRIBUTES = config.attributes
local SKILLS = config.skills

local M = {}

function M.has_plugin(pid)
  return Players[pid].data.customVariables.RELE ~= nil
end

function M.get_current_level(pid)
  return Players[pid].data.stats.level
end

function M.get_cached_level(pid)
  return Players[pid].data.customVariables.RELE.cached_level
end

function M.set_cached_level(pid, val)
  Players[pid].data.customVariables.RELE.cached_level = val
end

function M.get_attribute(pid, attribute)
  return Players[pid].data.attributes[attribute].base
end

function M.set_attribute(pid, attribute, val)
  Players[pid].data.attributes[attribute].base = val
end

function M.get_cached_attribute(pid, attribute)
  return Players[pid].data.customVariables.RELE.cached_attributes[attribute]
end

function M.set_cached_attribute(pid, attribute, val)
  Players[pid].data.customVariables.RELE.cached_attributes[attribute] = val
end

function M.get_attribute_points_on_level(pid, attribute)
  return Players[pid].data.customVariables.RELE.attribute_points_on_level[attribute]
end

function M.set_attribute_points_on_level(pid, attribute, val)
  Players[pid].data.customVariables.RELE.attribute_points_on_level[attribute] = val
end

function M.get_skill(pid, skill)
  return Players[pid].data.skills[skill].base
end

function M.get_cached_skill(pid, skill)
  return Players[pid].data.customVariables.RELE.cached_skills[skill]
end

function M.set_cached_skill(pid, skill, val)
  Players[pid].data.customVariables.RELE.cached_skills[skill] = val
end

function M.cached_major_skill_ups(pid)
  return Players[pid].data.customVariables.RELE.cached_major_skill_ups
end

function M.get_cached_major_skill_up(pid, attribute)
  return Players[pid].data.customVariables.RELE.cached_major_skill_ups[attribute]
end

function M.set_cached_major_skill_up(pid, attribute, val)
  Players[pid].data.customVariables.RELE.cached_major_skill_ups[attribute] = val
end

function M.cached_minor_skill_ups(pid)
  return Players[pid].data.customVariables.RELE.cached_minor_skill_ups
end

function M.get_cached_minor_skill_up(pid, attribute)
  return Players[pid].data.customVariables.RELE.cached_minor_skill_ups[attribute]
end

function M.set_cached_minor_skill_up(pid, attribute, val)
  Players[pid].data.customVariables.RELE.cached_minor_skill_ups[attribute] = val
end

function M.cached_misc_skill_ups(pid)
  return Players[pid].data.customVariables.RELE.cached_misc_skill_ups
end

function M.get_cached_misc_skill_up(pid, attribute)
  return Players[pid].data.customVariables.RELE.cached_misc_skill_ups[attribute]
end

function M.set_cached_misc_skill_up(pid, attribute, val)
  Players[pid].data.customVariables.RELE.cached_misc_skill_ups[attribute] = val
end

function M.get_attribute_skill_ups(pid, attribute)
  return Players[pid].data.customVariables.RELE.attribute_skill_ups[attribute]
end

-- TODO singularize
function M.set_attribute_skill_ups(pid, attribute, val)
  Players[pid].data.customVariables.RELE.attribute_skill_ups[attribute] = val
end

function M.cache_attributes(pid)
  for _, attribute in ipairs(ATTRIBUTES) do
    Players[pid].data.customVariables.RELE.cached_attributes[attribute] = M.get_attribute(pid, attribute)
  end
end

function M.cache_skills(pid)
  for _, skill in ipairs(SKILLS) do
    Players[pid].data.customVariables.RELE.cached_skills[skill] = M.get_skill(pid, skill)
  end
end

return M

