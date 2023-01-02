local on_level = require('custom/reckless/level_up').on_level
local on_skill = require('custom/reckless/skill_up').on_skill

local config = require('custom/reckless/config')
local ATTRIBUTES = config.attributes
local SKILLS = config.skills

local accessors = require('custom/reckless/accessors')
local get_attribute = accessors.get_attribute
local get_current_level = accessors.get_current_level
local cache_attributes = accessors.cache_attributes
local cache_skills = accessors.cache_skills

local function init_player(_, pid)
  local data = {
    -- For potential future retroactive health calculations
    starting_endurance = get_attribute(pid, 'Endurance'),
    starting_strength = get_attribute(pid, 'Strength'),
    cached_level = get_current_level(pid),
    cached_attributes = {},
    cached_skills = {},
    attribute_points_on_level = {},
    -- TODO level_attribute_skills_ups
    attribute_skill_ups = {},
    -- TODO attribute_skills_ups
    -- remove cached_ prefix
    cached_major_skill_ups = {},
    cached_minor_skill_ups = {},
    cached_misc_skill_ups = {},
  }

  for _, attribute in ipairs(ATTRIBUTES) do
    data.attribute_skill_ups[attribute] = 0
    data.attribute_points_on_level[attribute] = 0
    data.cached_major_skill_ups[attribute] = 0
    data.cached_minor_skill_ups[attribute] = 0
    data.cached_misc_skill_ups[attribute] = 0
  end

  Players[pid].data.customVariables.RELE = data

  cache_attributes(pid)
  cache_skills(pid)

  tes3mp.SendMessage(pid, "Reckless Leveling: INITIALIZED" .. '\n')
end

-- TODO add console ui and more messages and popup

customEventHooks.registerHandler('OnPlayerEndCharGen', init_player)
customEventHooks.registerHandler('OnPlayerLevel', on_level)
customEventHooks.registerHandler('OnPlayerSkill', on_skill)
