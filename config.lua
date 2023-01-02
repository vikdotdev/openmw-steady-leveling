M = {}

M.attribute_default_bonuses = {
  Strength = 4,
  Intelligence = 4,
  Willpower = 4,
  Agility = 4,
  Speed = 4,
  Endurance = 4,
  Personality = 4,
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
