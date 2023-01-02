M = {}

-- Simulate how much attributes bonuses character should get on next level-up.
-- Recommended value is between 2 and 10 in multiplicity of 2:
--
--   0 -> x1, 1 -> x2, 5 -> x3, 8 -> x4, 10 -> x5.
M.DEFAULT_ATTRIBUTE_SKILL_INC = 5

-- Determines minimum attribute value increase on level-up. Set this according to
-- DEFAULT_ATTRIBUTE_SKILL_INC_BONUS: 0 -> 1, 1 -> 2, 5 -> 3, 8 -> 4, 10 -> 5.
M.DEFAULT_ATTRIBUTE_BASE = 3

M.attribute_default_skill_increases = {
  Strength     = M.DEFAULT_ATTRIBUTE_SKILL_INC,
  Intelligence = M.DEFAULT_ATTRIBUTE_SKILL_INC,
  Willpower    = M.DEFAULT_ATTRIBUTE_SKILL_INC,
  Agility      = M.DEFAULT_ATTRIBUTE_SKILL_INC,
  Speed        = M.DEFAULT_ATTRIBUTE_SKILL_INC,
  Endurance    = M.DEFAULT_ATTRIBUTE_SKILL_INC,
  Personality  = M.DEFAULT_ATTRIBUTE_SKILL_INC,
  Luck = 0
}

M.attribute_base_increase = {
  Strength     = M.DEFAULT_ATTRIBUTE_BASE,
  Intelligence = M.DEFAULT_ATTRIBUTE_BASE,
  Willpower    = M.DEFAULT_ATTRIBUTE_BASE,
  Agility      = M.DEFAULT_ATTRIBUTE_BASE,
  Speed        = M.DEFAULT_ATTRIBUTE_BASE,
  Endurance    = M.DEFAULT_ATTRIBUTE_BASE,
  Personality  = M.DEFAULT_ATTRIBUTE_BASE,
  Luck = 0
}

M.attributes = {
  'Strength', 'Intelligence', 'Willpower', 'Agility',
  'Speed', 'Endurance', 'Personality', 'Luck'
}

M.skills = {
  'Block', 'Armorer', 'Mediumarmor', 'Heavyarmor', 'Bluntweapon', 'Longblade',
  'Axe', 'Spear', 'Athletics', 'Enchant', 'Destruction', 'Alteration',
  'Illusion', 'Conjuration', 'Mysticism', 'Restoration', 'Alchemy',
  'Unarmored', 'Security', 'Sneak', 'Acrobatics', 'Lightarmor', 'Shortblade',
  'Marksman', 'Mercantile', 'Speechcraft', 'Handtohand',
}

M.governing_attributes = {
  Block = 'Agility',
  Armorer = 'Strength',
  Mediumarmor = 'Endurance',
  Heavyarmor = 'Endurance',
  Bluntweapon = 'Strength',
  Longblade = 'Strength',
  Axe = 'Strength',
  Spear = 'Endurance',
  Athletics = 'Speed',
  Enchant = 'Intelligence',
  Destruction = 'Willpower',
  Alteration = 'Willpower',
  Illusion = 'Personality',
  Conjuration = 'Intelligence',
  Mysticism = 'Willpower',
  Restoration = 'Willpower',
  Alchemy = 'Intelligence',
  Unarmored = 'Speed',
  Security = 'Intelligence',
  Sneak = 'Agility',
  Acrobatics = 'Strength',
  Lightarmor = 'Agility',
  Shortblade = 'Speed',
  Marksman = 'Agility',
  Mercantile = 'Personality',
  Speechcraft = 'Personality',
  Handtohand = 'Speed',
}

return M
