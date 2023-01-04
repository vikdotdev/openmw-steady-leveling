local base_path = 'custom/steady_leveling/'
local config = require(base_path .. 'config')
local ATTRIBUTES = config.ATTRIBUTES
local SKILLS = config.SKILLS

local M = {}

function M.has_plugin(pid)
  return Players[pid].data.customVariables.STELEV ~= nil
end

function M.get_current_level(pid)
  return Players[pid].data.stats.level
end

function M.get_cached_level(pid)
  return Players[pid].data.customVariables.STELEV.cached_level
end

function M.set_cached_level(pid, val)
  Players[pid].data.customVariables.STELEV.cached_level = val
end

function M.get_attribute(pid, attribute)
  return Players[pid].data.attributes[attribute].base
end

function M.set_attribute(pid, attribute, val)
  Players[pid].data.attributes[attribute].base = val
end

function M.get_cached_attribute(pid, attribute)
  return Players[pid].data.customVariables.STELEV.cached_attributes[attribute]
end

function M.set_cached_attribute(pid, attribute, val)
  Players[pid].data.customVariables.STELEV.cached_attributes[attribute] = val
end

function M.get_attribute_points_on_level(pid, attribute)
  return Players[pid].data.customVariables.STELEV.attribute_points_on_level[attribute]
end

function M.set_attribute_points_on_level(pid, attribute, val)
  Players[pid].data.customVariables.STELEV.attribute_points_on_level[attribute] = val
end

function M.get_skill(pid, skill)
  return Players[pid].data.skills[skill].base
end

function M.get_cached_skill(pid, skill)
  return Players[pid].data.customVariables.STELEV.cached_skills[skill]
end

function M.set_cached_skill(pid, skill, val)
  Players[pid].data.customVariables.STELEV.cached_skills[skill] = val
end

function M.gradual_major_attribute_increases(pid)
  return Players[pid].data.customVariables.STELEV.gradual_major_attribute_increases
end

function M.get_gradual_major_attribute_increase(pid, attribute)
  return Players[pid].data.customVariables.STELEV.gradual_major_attribute_increases[attribute]
end

function M.set_gradual_major_attribute_increase(pid, attribute, val)
  Players[pid].data.customVariables.STELEV.gradual_major_attribute_increases[attribute] = val
end

function M.gradual_minor_attribute_increases(pid)
  return Players[pid].data.customVariables.STELEV.gradual_minor_attribute_increases
end

function M.get_gradual_minor_attribute_increase(pid, attribute)
  return Players[pid].data.customVariables.STELEV.gradual_minor_attribute_increases[attribute]
end

function M.set_gradual_minor_attribute_increase(pid, attribute, val)
  Players[pid].data.customVariables.STELEV.gradual_minor_attribute_increases[attribute] = val
end

function M.gradual_misc_attribute_increases(pid)
  return Players[pid].data.customVariables.STELEV.gradual_misc_attribute_increases
end

function M.get_gradual_misc_attribute_increase(pid, attribute)
  return Players[pid].data.customVariables.STELEV.gradual_misc_attribute_increases[attribute]
end

function M.set_gradual_misc_attribute_increase(pid, attribute, val)
  Players[pid].data.customVariables.STELEV.gradual_misc_attribute_increases[attribute] = val
end

function M.get_level_attribute_skill_increases(pid, attribute)
  return Players[pid].data.customVariables.STELEV.level_attribute_skill_increases[attribute]
end

function M.set_level_attribute_skill_increases(pid, attribute, val)
  Players[pid].data.customVariables.STELEV.level_attribute_skill_increases[attribute] = val
end

function M.cache_attributes(pid)
  for _, attribute in ipairs(ATTRIBUTES) do
    Players[pid].data.customVariables.STELEV.cached_attributes[attribute] = M.get_attribute(pid, attribute)
  end
end

function M.cache_skills(pid)
  for _, skill in ipairs(SKILLS) do
    Players[pid].data.customVariables.STELEV.cached_skills[skill] = M.get_skill(pid, skill)
  end
end

return M

