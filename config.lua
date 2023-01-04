M = {}

-- Change these to change leveling pace and/or increase class focused gameplay.
M.MAJOR_SKILL_UP_PER_ATTR = 3
M.MINOR_SKILL_UP_PER_ATTR = 4
M.MISC_SKILL_UP_PER_ATTR = 10

M.SPECIALIZATIONS = { 'Combat', 'Magic', 'Stealth' }

-- For incremental attribute increases.
M.ATTRIBUTE_CAP = 100

M.ATTRIBUTES = {
  'Strength', 'Intelligence', 'Willpower', 'Agility',
  'Speed', 'Endurance', 'Personality', 'Luck'
}

M.SKILLS = {
  'Block', 'Armorer', 'Mediumarmor', 'Heavyarmor', 'Bluntweapon', 'Longblade',
  'Axe', 'Spear', 'Athletics', 'Enchant', 'Destruction', 'Alteration',
  'Illusion', 'Conjuration', 'Mysticism', 'Restoration', 'Alchemy',
  'Unarmored', 'Security', 'Sneak', 'Acrobatics', 'Lightarmor', 'Shortblade',
  'Marksman', 'Mercantile', 'Speechcraft', 'Handtohand',
}

M.GOVERNING_ATTRIBUTES_BY_STRING = {
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

M.SKILL_ID_SKILL_NAME_MAP = {
  [0] = 'Block',
  [1] = 'Armorer',
  [2] = 'Mediumarmor',
  [3] = 'Heavyarmor',
  [4] = 'Bluntweapon',
  [5] = 'Longblade',
  [6] = 'Axe',
  [7] = 'Spear',
  [8] = 'Athletics',
  [9] = 'Enchant',
  [10] = 'Destruction',
  [11] = 'Alteration',
  [12] = 'Illusion',
  [13] = 'Conjuration',
  [14] = 'Mysticism',
  [15] = 'Restoration',
  [16] = 'Alchemy',
  [17] = 'Unarmored',
  [18] = 'Security',
  [19] = 'Sneak',
  [20] = 'Acrobatics',
  [21] = 'Lightarmor',
  [22] = 'Shortblade',
  [23] = 'Marksman',
  [24] = 'Mercantile',
  [25] = 'Speechcraft',
  [26] = 'Handtohand'
}

M.DEFAULT_CLASSES = {}

M.DEFAULT_CLASSES["acrobat"] = {
	name = "Acrobat",
	specialization = 2,
	majorAttributes = {'Agility', 'Endurance'},
	majorSkills = {'Acrobatics', 'Athletics', 'Marksman', 'Sneak', 'Unarmored'},
	minorSkills = {'Speechcraft', 'Alteration', 'Spear', 'Handtohand', 'Lightarmor'},
	description = "Acrobat is a polite euphemism for agile burglars and second-story men. These thieves avoid detection by stealth, and rely on mobility and cunning to avoid capture.",
}

M.DEFAULT_CLASSES["agent"] = {
	name = "Agent",
	specialization = 2,
	majorAttributes = {'Personality', 'Agility'},
	majorSkills = {'Speechcraft', 'Sneak', 'Acrobatics', 'Lightarmor', 'Shortblade'},
	minorSkills = {'Mercantile', 'Conjuration', 'Block', 'Unarmored', 'Illusion'},
	description = "Agents are operatives skilled in deception and avoidance, but trained in self-defense and the use of deadly force. Self-reliant and independent, agents devote themselves to personal goals, or to various patrons or causes.",
}

M.DEFAULT_CLASSES["archer"] = {
	name = "Archer",
	specialization = 0,
	majorAttributes = {'Agility', 'Strength'},
	majorSkills = {'Marksman', 'Longblade', 'Block', 'Athletics', 'Ligharmor'},
	minorSkills = {'Unarmored', 'Spear', 'Restoration', 'Sneak', 'Mediumarmor'},
	description = "Archers are fighters specializing in long-range combat and rapid movement. Opponents are kept at distance by ranged weapons and swift maneuver, and engaged in melee with sword and shield after the enemy is wounded and weary.",
}
M.DEFAULT_CLASSES["assassin"] = {
	name = "Assassin",
	specialization = 2,
	majorAttributes = {'Speed', 'Intelligence'},
	majorSkills = {'Sneak', 'Marksman', 'Ligharmor', 'Shortblade', 'Acrobatics'},
	minorSkills = {'Security', 'Longblade', 'Alchemy', 'Block', 'Athletics'},
	description = "Assassins are killers who rely on stealth and mobility to approach victims undetected. Execution is with ranged weapons or with short blades for close work. Assassins include ruthless murderers and principled agents of noble causes.",
}
M.DEFAULT_CLASSES["barbarian"] = {
	name = "Barbarian",
	specialization = 0,
	majorAttributes = {'Strength', 'Speed'},
	majorSkills = {'Axe', 'Mediumarmor', 'Bluntweapon', 'Athletics', 'Block'},
	minorSkills = {'Acrobatics', 'Ligharmor', 'Armorer', 'Marksman', 'Unarmored'},
	description = "Barbarians are the proud, savage warrior elite of the plains nomads, mountain tribes, and sea reavers. They tend to be brutal and direct, lacking civilized graces, but they glory in heroic feats, and excel in fierce, frenzied single combat.",
}
M.DEFAULT_CLASSES["bard"] = {
	name = "Bard",
	specialization = 2,
	majorAttributes = {'Personality', 'Intelligence'},
	majorSkills = {'Speechcraft', 'Athletics', 'Acrobatics', 'Longblade', 'Block'},
	minorSkills = {'Mercantile', 'Illusion', 'Mediumarmor', 'Enchant', 'Security'},
	description = "Bards are loremasters and storytellers. They crave adventure for the wisdom and insight to be gained, and must depend on sword, shield, spell and enchantment to preserve them from the perils of their educational experiences.",
}
M.DEFAULT_CLASSES["battlemage"] = {
	name = "Battlemage",
	specialization = 1,
	majorAttributes = {'Intelligence', 'Strength'},
	majorSkills = {'Alteration', 'Destruction', 'Conjuration', 'Axe', 'Heavyarmor'},
	minorSkills = {'Mysticism', 'Longblade', 'Marksman', 'Enchant', 'Alchemy'},
	description = "Battlemages are wizard-warriors, trained in both lethal spellcasting and heavily armored combat. They sacrifice mobility and versatility for the ability to supplement melee and ranged attacks with elemental damage and summoned creatures.",
}
M.DEFAULT_CLASSES["crusader"] = {
	name = "Crusader",
	specialization = 0,
	majorAttributes = {'Agility', 'Strength'},
	majorSkills = {'Bluntweapon', 'Longblade', 'Destruction', 'Heavyarmor', 'Block'},
	minorSkills = {'Restoration', 'Armorer', 'Handtohand', 'Mediumarmor', 'Alchemy'},
	description = "Any heavily armored warrior with spellcasting powers and a good cause may call himself a Crusader. Crusaders do well by doing good. They hunt monsters and villains, making themselves rich by plunder as they rid the world of evil.",
}
M.DEFAULT_CLASSES["healer"] = {
	name = "Healer",
	specialization = 1,
	majorAttributes = {'Willpower', 'Personality'},
	majorSkills = {'Restoration', 'Mysticism', 'Alteration', 'Handtohand', 'Speechcraft'},
	minorSkills = {'Illusion', 'Alchemy', 'Unarmored', 'Ligharmor', 'Bluntweapon'},
	description = "Healers are spellcasters who swear solemn oaths to heal the afflicted and cure the diseased. When threatened, they defend themselves with reason and disabling attacks and magic, relying on deadly force only in extremity.",
}
M.DEFAULT_CLASSES["knight"] = {
	name = "Knight",
	specialization = 0,
	majorAttributes = {'Strength', 'Personality'},
	majorSkills = {'Longblade', 'Axe', 'Speechcraft', 'Heavyarmor', 'Block'},
	minorSkills = {'Restoration', 'Mercantile', 'Mediumarmor', 'Enchant', 'Armorer'},
	description = "Of noble birth, or distinguished in battle or tourney, knights are civilized warriors, schooled in letters and courtesy, governed by the codes of chivalry. In addition to the arts of war, knights study the lore of healing and enchantment.",
}
M.DEFAULT_CLASSES["mage"] = {
	name = "Mage",
	specialization = 1,
	majorAttributes = {'Intelligence', 'Willpower'},
	majorSkills = {'Mysticism', 'Destruction', 'Alteration', 'Illusion', 'Restoration'},
	minorSkills = {'Enchant', 'Alchemy', 'Unarmored', 'Shortblade', 'Conjuration'},
	description = "Most mages claim to study magic for its intellectual rewards, but they also often profit from its practical applications. Varying widely in temperament and motivation, mages share but one thing in common - an avid love of spellcasting.",
}
M.DEFAULT_CLASSES["monk"] = {
	name = "Monk",
	specialization = 2,
	majorAttributes = {'Agility', 'Willpower'},
	majorSkills = {'Handtohand', 'Unarmored', 'Athletics', 'Acrobatics', 'Sneak'},
	minorSkills = {'Block', 'Marksman', 'Ligharmor', 'Restoration', 'Bluntweapon'},
	description = "Monks are students of the ancient martial arts of hand-to-hand combat and unarmored self defense. Monks avoid detection by stealth, mobility, and Agility, and are skilled with a variety of ranged and close-combat weapons.",
}
M.DEFAULT_CLASSES["nightblade"] = {
	name = "Nightblade",
	specialization = 1,
	majorAttributes = {'Willpower', 'Speed'},
	majorSkills = {'Mysticism', 'Illusion', 'Alteration', 'Sneak', 'Shortblade'},
	minorSkills = {'Ligharmor', 'Unarmored', 'Destruction', 'Marksman', 'Security'},
	description = "Nightblades are spellcasters who use their magics to enhance mobility, concealment, and stealthy close combat. They have a sinister reputation, since many nightblades are thieves, enforcers, assassins, or covert agents.",
}
M.DEFAULT_CLASSES["pilgrim"] = {
	name = "Pilgrim",
	specialization = 2,
	majorAttributes = {'Personality', 'Endurance'},
	majorSkills = {'Speechcraft', 'Mercantile', 'Marksman', 'Restoration', 'Mediumarmor'},
	minorSkills = {'Illusion', 'Handtohand', 'Shortblade', 'Block', 'Alchemy'},
	description = "Pilgrims are travellers, seekers of truth and enlightenment. They fortify themselves for road and wilderness with arms, armor, and magic, and through wide experience of the world, they become shrewd in commerce and persuasion.",
}
M.DEFAULT_CLASSES["rogue"] = {
	name = "Rogue",
	specialization = 0,
	majorAttributes = {'Speed', 'Personality'},
	majorSkills = {'Shortblade', 'Mercantile', 'Axe', 'Ligharmor', 'Handtohand'},
	minorSkills = {'Block', 'Mediumarmor', 'Speechcraft', 'Athletics', 'Longblade'},
	description = "Rogues are adventurers and opportunists with a gift for getting in and out of trouble. Relying variously on charm and dash, blades and business sense, they thrive on conflict and misfortune, trusting to their luck and cunning to survive.",
}

M.DEFAULT_CLASSES["scout"] = {
	name = "Scout",
	specialization = 0,
	majorAttributes = {'Speed', 'Endurance'},
	majorSkills = {'Sneak', 'Longblade', 'Mediumarmor', 'Athletics', 'Block'},
	minorSkills = {'Marksman', 'Alchemy', 'Alteration', 'Ligharmor', 'Unarmored'},
	description = "Scouts rely on stealth to survey routes and opponents, using ranged weapons and skirmish tactics when forced to fight. By contrast with barbarians, in combat scouts tend to be cautious and methodical, rather than impulsive.",
}

M.DEFAULT_CLASSES["sorcerer"] = {
	name = "Sorcerer",
	specialization = 1,
	majorAttributes = {'Intelligence', 'Endurance'},
	majorSkills = {'Enchant', 'Conjuration', 'Mysticism', 'Destruction', 'Alteration'},
	minorSkills = {'Illusion', 'Mediumarmor', 'Heavyarmor', 'Marksman', 'Shortblade'},
	description = "Though spellcasters by vocation, sorcerers rely most on summonings and enchantments. They are greedy for magic scrolls, rings, armor and weapons, and commanding undead and Daedric servants gratifies their egos.",
}

M.DEFAULT_CLASSES["spellsword"] = {
	name = "Spellsword",
	specialization = 1,
	majorAttributes = {'Willpower', 'Endurance'},
	majorSkills = {'Block', 'Restoration', 'Longblade', 'Destruction', 'Alteration'},
	minorSkills = {'Bluntweapon', 'Enchant', 'Alchemy', 'Mediumarmor', 'Axe'},
	description = "Spellswords are spellcasting specialists trained to support Imperial troops in skirmish and in battle. Veteran spellswords are prized as mercenaries, and well-suited for careers as adventurers and soldiers-of-fortune.",
}

M.DEFAULT_CLASSES["thief"] = {
	name = "Thief",
	specialization = 2,
	majorAttributes = {'Speed', 'Agility'},
	majorSkills = {'Security', 'Sneak', 'Acrobatics', 'Ligharmor', 'Shortblade'},
	minorSkills = {'Marksman', 'Speechcraft', 'Handtohand', 'Mercantile', 'Athletics'},
	description = "Thieves are pickpockets and pilferers. Unlike robbers, who kill and loot, thieves typically choose stealth and subterfuge over violence, and often entertain romantic notions of their charm and cleverness in their acquisitive activities.",
}

M.DEFAULT_CLASSES["warrior"] = {
	name = "Warrior",
	specialization = 0,
	majorAttributes = {'Strength', 'Endurance'},
	majorSkills = {'Longblade', 'Mediumarmor', 'Heavyarmor', 'Athletics', 'Block'},
	minorSkills = {'Armorer', 'Spear', 'Marksman', 'Axe', 'Bluntweapon'},
	description = "Warriors are the professional men-at-arms, soldiers, mercenaries, and adventurers of the Empire, trained with various weapons and armor styles, conditioned by long marches, and hardened by ambush, skirmish, and battle.",
}

M.DEFAULT_CLASSES["witchhunter"] = {
	name = "Witchhunter",
	specialization = 1,
	majorAttributes = {'Intelligence', 'Agility'},
	majorSkills = {'Conjuration', 'Enchant', 'Alchemy', 'Ligharmor', 'Marksman'},
	minorSkills = {'Unarmored', 'Block', 'Bluntweapon', 'Sneak', 'Mysticism'},
	description = "Witchhunters are dedicated to rooting out and destroying the perverted practices of dark cults and profane sorcery. They train for martial, magical, and stealthy war against vampires, witches, warlocks, and necromancers.",
}

return M
