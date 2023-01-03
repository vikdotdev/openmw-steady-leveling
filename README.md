# OpenMW Steady Leveling
Leveling system in Morrowind is way too easy _(and tempting)_ to abuse. This
script nerfs new-level menu attributes heavily and adds incremental leveling
system on top.

## Not actually OpenMW, yet
The only implementation available now is for TES3MP multiplayer fork. I'm open
to implementing _(or getting help with it)_ the same for single-player OpenMW at
some point if anyone is interested.

This was tested on TES3MP v0.8.1

# How it works
Vanilla leveling system allowed to increase attribute up to x5 on level-up for
_any_ skill and it needed 2 point of said skill to increase the bonus. This
script turns it on its head and does a maximum of x2 bonus and for every 5
skill increases.

This was done to give way to a more class-based leveling system which favors
attribute increases for major and minor skills. The default config increments
governing attribute of a major skill for every 3 increases of that skill, 4
for minor skills and 10 for misc skills.

This can be configured in `config.lua`.

# Installation
Synopsis:
```
cd <your tes3mp folder>
mkdir -p server/scripts/custom/steady_leveling
cd server/scripts/custom
git clone https://github.com/vikdotdev/openmw-steady-leveling
mv openmw-steady-leveling steady_leveling

cd <your tes3mp folder>

# appends the line to a file
echo 'require("scripts/custom/steady_leveling/init")' >> scripts/customScripts/init
```

# Tweaking
There's only a couple

# Credit
This mod is based on [this mod](https://github.com/phi-fell/carefree_leveling#phis-carefree-leveling)
with some things from [these mods](https://github.com/Atkana/tes3mp-scripts).
Go check those out.

