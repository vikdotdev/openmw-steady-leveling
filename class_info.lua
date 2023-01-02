local config = require('custom/reckless/config')
local default_classes = config.default_classes
local skill_id_skill_name_map = config.skill_id_skill_name_map

M = {}

local function get_default_class(class_id)
	return default_classes[class_id]
end

local function generate_custom_class(pid)
	local player_class = Players[pid].data.customClass
	local data = {}

	data.name = player_class.name
	data.description = player_class.description

	local major = {}
	table.insert(major, tes3mp.GetClassMajorSkill(pid, 0))
	table.insert(major, tes3mp.GetClassMajorSkill(pid, 1))
	table.insert(major, tes3mp.GetClassMajorSkill(pid, 2))
	table.insert(major, tes3mp.GetClassMajorSkill(pid, 3))
	table.insert(major, tes3mp.GetClassMajorSkill(pid, 4))

	local minor = {}
	table.insert(minor, tes3mp.GetClassMinorSkill(pid, 0))
	table.insert(minor, tes3mp.GetClassMinorSkill(pid, 1))
	table.insert(minor, tes3mp.GetClassMinorSkill(pid, 2))
	table.insert(minor, tes3mp.GetClassMinorSkill(pid, 3))
	table.insert(minor, tes3mp.GetClassMinorSkill(pid, 4))

	data.major_skills = major
	data.minor_skills = minor

	return data
end

function M.get_player_class(pid)
	if tes3mp.IsClassDefault(pid) == 1 then
		return get_default_class(Players[pid].data.character.class)
	else
		return generate_custom_class(pid)
	end
end

function M.is_skill_major_or_minor(pid, skill)
	local player_class = M.get_player_class(pid)

  local found = false
	for _, skill_id in ipairs(player_class.majorSkills) do
    if skill_id_skill_name_map[skill_id] == skill then
      found = true
    end
	end

	for _, skill_id in ipairs(player_class.minorSkills) do
    if skill_id_skill_name_map[skill_id] == skill then
      found = true
    end
	end

  return found
end

return M
