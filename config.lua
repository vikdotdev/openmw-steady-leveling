M = {}

-- For incremental attribute increases.
M.ATTRIBUTE_CAP = 100

M.MAJOR_SKILL_UP_PER_ATTR = 3
M.MINOR_SKILL_UP_PER_ATTR = 4
M.MISC_SKILL_UP_PER_ATTR = 8

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

M.SKILL_ID_SKILL_NAME_MAP = {
  [0] = 'Block',
  [1] = 'Armorer',
  [2] = 'Medium Armor',
  [3] = 'Heavy Armor',
  [4] = 'Blunt Weapon',
  [5] = 'Long Blade',
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
  [21] = 'Light Armor',
  [22] = 'Short Blade',
  [23] = 'Marksman',
  [24] = 'Mercantile',
  [25] = 'Speechcraft',
  [26] = 'Hand-to-hand'
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

M.DEFAULT_CLASSES = {}

M.DEFAULT_CLASSES["acrobat"] = {
	name = "Acrobat",
	specialization = 2,
	majorAttributes = {3, 5},
	majorSkills = {20, 8, 23, 19, 17},
	minorSkills = {25, 11, 7, 26, 21},
	description = "Acrobat is a polite euphemism for agile burglars and second-story men. These thieves avoid detection by stealth, and rely on mobility and cunning to avoid capture.",
}

M.DEFAULT_CLASSES["agent"] = {
	name = "Agent",
	specialization = 2,
	majorAttributes = {6, 3},
	majorSkills = {25, 19, 20, 21, 22},
	minorSkills = {24, 13, 0, 17, 12},
	description = "Agents are operatives skilled in deception and avoidance, but trained in self-defense and the use of deadly force. Self-reliant and independent, agents devote themselves to personal goals, or to various patrons or causes.",
}

M.DEFAULT_CLASSES["archer"] = {
	name = "Archer",
	specialization = 0,
	majorAttributes = {3, 0},
	majorSkills = {23, 5, 0, 8, 21},
	minorSkills = {17, 7, 15, 19, 2},
	description = "Archers are fighters specializing in long-range combat and rapid movement. Opponents are kept at distance by ranged weapons and swift maneuver, and engaged in melee with sword and shield after the enemy is wounded and weary.",
}
M.DEFAULT_CLASSES["assassin"] = {
	name = "Assassin",
	specialization = 2,
	majorAttributes = {4, 1},
	majorSkills = {19, 23, 21, 22, 20},
	minorSkills = {18, 5, 16, 0, 8},
	description = "Assassins are killers who rely on stealth and mobility to approach victims undetected. Execution is with ranged weapons or with short blades for close work. Assassins include ruthless murderers and principled agents of noble causes.",
}
M.DEFAULT_CLASSES["barbarian"] = {
	name = "Barbarian",
	specialization = 0,
	majorAttributes = {0, 4},
	majorSkills = {6, 2, 4, 8, 0},
	minorSkills = {20, 21, 1, 23, 17},
	description = "Barbarians are the proud, savage warrior elite of the plains nomads, mountain tribes, and sea reavers. They tend to be brutal and direct, lacking civilized graces, but they glory in heroic feats, and excel in fierce, frenzied single combat.",
}
M.DEFAULT_CLASSES["bard"] = {
	name = "Bard",
	specialization = 2,
	majorAttributes = {6, 1},
	majorSkills = {25, 8, 20, 5, 0},
	minorSkills = {24, 12, 2, 9, 18},
	description = "Bards are loremasters and storytellers. They crave adventure for the wisdom and insight to be gained, and must depend on sword, shield, spell and enchantment to preserve them from the perils of their educational experiences.",
}
M.DEFAULT_CLASSES["battlemage"] = {
	name = "Battlemage",
	specialization = 1,
	majorAttributes = {1, 0},
	majorSkills = {11, 10, 13, 6, 3},
	minorSkills = {14, 5, 23, 9, 16},
	description = "Battlemages are wizard-warriors, trained in both lethal spellcasting and heavily armored combat. They sacrifice mobility and versatility for the ability to supplement melee and ranged attacks with elemental damage and summoned creatures.",
}
M.DEFAULT_CLASSES["crusader"] = {
	name = "Crusader",
	specialization = 0,
	majorAttributes = {3, 0},
	majorSkills = {4, 5, 10, 3, 0},
	minorSkills = {15, 1, 26, 2, 16},
	description = "Any heavily armored warrior with spellcasting powers and a good cause may call himself a Crusader. Crusaders do well by doing good. They hunt monsters and villains, making themselves rich by plunder as they rid the world of evil.",
}
M.DEFAULT_CLASSES["healer"] = {
	name = "Healer",
	specialization = 1,
	majorAttributes = {2, 6},
	majorSkills = {15, 14, 11, 26, 25},
	minorSkills = {12, 16, 17, 21, 4},
	description = "Healers are spellcasters who swear solemn oaths to heal the afflicted and cure the diseased. When threatened, they defend themselves with reason and disabling attacks and magic, relying on deadly force only in extremity.",
}
M.DEFAULT_CLASSES["knight"] = {
	name = "Knight",
	specialization = 0,
	majorAttributes = {0, 6},
	majorSkills = {5, 6, 25, 3, 0},
	minorSkills = {15, 24, 2, 9, 1},
	description = "Of noble birth, or distinguished in battle or tourney, knights are civilized warriors, schooled in letters and courtesy, governed by the codes of chivalry. In addition to the arts of war, knights study the lore of healing and enchantment.",
}
M.DEFAULT_CLASSES["mage"] = {
	name = "Mage",
	specialization = 1,
	majorAttributes = {1, 2},
	majorSkills = {14, 10, 11, 12, 15},
	minorSkills = {9, 16, 17, 22, 13},
	description = "Most mages claim to study magic for its intellectual rewards, but they also often profit from its practical applications. Varying widely in temperament and motivation, mages share but one thing in common - an avid love of spellcasting.",
}
M.DEFAULT_CLASSES["monk"] = {
	name = "Monk",
	specialization = 2,
	majorAttributes = {3, 2},
	majorSkills = {26, 17, 8, 20, 19},
	minorSkills = {0, 23, 21, 15, 4},
	description = "Monks are students of the ancient martial arts of hand-to-hand combat and unarmored self defense. Monks avoid detection by stealth, mobility, and Agility, and are skilled with a variety of ranged and close-combat weapons.",
}
M.DEFAULT_CLASSES["nightblade"] = {
	name = "Nightblade",
	specialization = 1,
	majorAttributes = {2, 4},
	majorSkills = {14, 12, 11, 19, 22},
	minorSkills = {21, 17, 10, 23, 18},
	description = "Nightblades are spellcasters who use their magics to enhance mobility, concealment, and stealthy close combat. They have a sinister reputation, since many nightblades are thieves, enforcers, assassins, or covert agents.",
}
M.DEFAULT_CLASSES["pilgrim"] = {
	name = "Pilgrim",
	specialization = 2,
	majorAttributes = {6, 5},
	majorSkills = {25, 24, 23, 15, 2},
	minorSkills = {12, 26, 22, 0, 16},
	description = "Pilgrims are travellers, seekers of truth and enlightenment. They fortify themselves for road and wilderness with arms, armor, and magic, and through wide experience of the world, they become shrewd in commerce and persuasion.",
}
M.DEFAULT_CLASSES["rogue"] = {
	name = "Rogue",
	specialization = 0,
	majorAttributes = {4, 6},
	majorSkills = {22, 24, 6, 21, 26},
	minorSkills = {0, 2, 25, 8, 5},
	description = "Rogues are adventurers and opportunists with a gift for getting in and out of trouble. Relying variously on charm and dash, blades and business sense, they thrive on conflict and misfortune, trusting to their luck and cunning to survive.",
}

M.DEFAULT_CLASSES["scout"] = {
	name = "Scout",
	specialization = 0,
	majorAttributes = {4, 5},
	majorSkills = {19, 5, 2, 8, 0},
	minorSkills = {23, 16, 11, 21, 17},
	description = "Scouts rely on stealth to survey routes and opponents, using ranged weapons and skirmish tactics when forced to fight. By contrast with barbarians, in combat scouts tend to be cautious and methodical, rather than impulsive.",
}

M.DEFAULT_CLASSES["sorcerer"] = {
	name = "Sorcerer",
	specialization = 1,
	majorAttributes = {1, 5},
	majorSkills = {9, 13, 14, 10, 11},
	minorSkills = {12, 2, 3, 23, 22},
	description = "Though spellcasters by vocation, sorcerers rely most on summonings and enchantments. They are greedy for magic scrolls, rings, armor and weapons, and commanding undead and Daedric servants gratifies their egos.",
}

M.DEFAULT_CLASSES["spellsword"] = {
	name = "Spellsword",
	specialization = 1,
	majorAttributes = {2, 5},
	majorSkills = {0, 15, 5, 10, 11},
	minorSkills = {4, 9, 16, 2, 6},
	description = "Spellswords are spellcasting specialists trained to support Imperial troops in skirmish and in battle. Veteran spellswords are prized as mercenaries, and well-suited for careers as adventurers and soldiers-of-fortune.",
}

M.DEFAULT_CLASSES["thief"] = {
	name = "Thief",
	specialization = 2,
	majorAttributes = {4, 3},
	majorSkills = {18, 19, 20, 21, 22},
	minorSkills = {23, 25, 26, 24, 8},
	description = "Thieves are pickpockets and pilferers. Unlike robbers, who kill and loot, thieves typically choose stealth and subterfuge over violence, and often entertain romantic notions of their charm and cleverness in their acquisitive activities.",
}

M.DEFAULT_CLASSES["warrior"] = {
	name = "Warrior",
	specialization = 0,
	majorAttributes = {0, 5},
	majorSkills = {5, 2, 3, 8, 0},
	minorSkills = {1, 7, 23, 6, 4},
	description = "Warriors are the professional men-at-arms, soldiers, mercenaries, and adventurers of the Empire, trained with various weapons and armor styles, conditioned by long marches, and hardened by ambush, skirmish, and battle.",
}

M.DEFAULT_CLASSES["witchhunter"] = {
	name = "Witchhunter",
	specialization = 1,
	majorAttributes = {1, 3},
	majorSkills = {13, 9, 16, 21, 23},
	minorSkills = {17, 0, 4, 19, 14},
	description = "Witchhunters are dedicated to rooting out and destroying the perverted practices of dark cults and profane sorcery. They train for martial, magical, and stealthy war against vampires, witches, warlocks, and necromancers.",
}

return M
