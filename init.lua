local base_path = 'custom/steady_leveling/'
local on_level = require(base_path .. 'level_up').on_level
local on_skill = require(base_path .. 'skill_up').on_skill

local config = require(base_path .. 'config')
local ATTRIBUTES = config.ATTRIBUTES

local accessors = require(base_path .. 'accessors')
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
    level_attribute_skill_increases = {},
    gradual_major_attribute_increases = {},
    gradual_minor_attribute_increases = {},
    gradual_misc_attribute_increases = {},
  }

  for _, attribute in ipairs(ATTRIBUTES) do
    data.level_attribute_skill_increases[attribute] = 0
    data.attribute_points_on_level[attribute] = 0
    data.gradual_major_attribute_increases[attribute] = 0
    data.gradual_minor_attribute_increases[attribute] = 0
    data.gradual_misc_attribute_increases[attribute] = 0
  end

  Players[pid].data.customVariables.RELE = data

  cache_attributes(pid)
  cache_skills(pid)

  tes3mp.SendMessage(pid, "Reckless Leveling: INITIALIZED" .. '\n')
end

-- LATER: add console ui and more messages and popup

customEventHooks.registerHandler('OnPlayerEndCharGen', init_player)
customEventHooks.registerHandler('OnPlayerLevel', on_level)
customEventHooks.registerHandler('OnPlayerSkill', on_skill)
