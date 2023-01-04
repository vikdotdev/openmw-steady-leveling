local base_path = 'custom/steady_leveling/'
local config = require(base_path .. 'config')
local DEFAULT_CLASSES = config.DEFAULT_CLASSES
local SKILL_ID_SKILL_NAME_MAP = config.SKILL_ID_SKILL_NAME_MAP

M = {}

local function get_default_class(class_id)
	return DEFAULT_CLASSES[class_id]
end

local function generate_custom_class(pid)
  local player_class = Players[pid].data.customClass
  local data = {}

  data.name = player_class.name
  data.description = player_class.description

  local major = {}
  local minor = {}

  for _, index in ipairs({ 0, 1, 2, 3, 4 }) do
    table.insert(major, tes3mp.GetClassMajorSkill(pid, index))
  end
  for _, index in ipairs({ 0, 1, 2, 3, 4 }) do
    table.insert(minor, tes3mp.GetClassMinorSkill(pid, index))
  end

  data.majorSkills = major
  data.minorSkills = minor

  return data
end

function M.get_player_class(pid)
	if tes3mp.IsClassDefault(pid) == 1 then
		return get_default_class(Players[pid].data.character.class)
	else
		return generate_custom_class(pid)
	end
end

function M.is_skill_major(pid, skill)
	local player_class = M.get_player_class(pid)

  local found = false
  for _, player_skill in ipairs(player_class.majorSkills) do
    if SKILL_ID_SKILL_NAME_MAP[player_skill] == skill then
      found = true
    end
  end

  return found
end


function M.is_skill_minor(pid, skill)
	local player_class = M.get_player_class(pid)

  local found = false
  for _, player_skill in ipairs(player_class.minorSkills) do
    if SKILL_ID_SKILL_NAME_MAP[player_skill] == skill then
      found = true
    end
  end

  return found
end


return M
