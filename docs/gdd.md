
# Game Design Document - Untitled Hacktoberfest 2020 game

- [Game Design Document - Untitled Hacktoberfest 2020 game](#game-design-document---untitled-hacktoberfest-2020-game)
- [Pitch](#pitch)
- [Story](#story)
- [Gameplay](#gameplay)
- [Mechanics](#mechanics)

# Pitch

TODO

# Story

TODO

# Gameplay

TODO

# Mechanics


## **Towers**

* There are level 1 towers (or base towers) and level 2 towers (or upgraded towers). A level 2 tower can only be built on a base tower.
* Armor piercing_ represents the percentage of armor ignored when the damage is applied: for example, an armor piercing value of 20% applied to an armor of 10 means that, for purposes of damage calculation, the armor value is only 8.
* There are three type of tower: Bunker, Missile and Sniper Tower.

---
### **Bunker**

**_Good:_**
* Economic tower
* Apply slow effect on enemies

**_Bad:_**
* Low range
* Cannot target flying enemies

**_Stats (first number is for base tower; second number is for upgraded tower):_**
```
Range				40 	/ 60
Damage				20 	/ 30
Armor piercing  	20%	/ 35%
Rate of Fire 		2 	/ 2.5
Slow effect 		30%	/ 50%
Cost 				100
Cost to upgrade 	300
```

**_Special:_**

Non flying enemies speed is reduced by percentage of slow effect (actual speed – x% of actual speed) when close to the range of the tower by smoke. Smoking is always on.

---
### **Missile Tower**

**_Good:_**
* Armor piercing
* Area damage

**_Bad:_**
* High cost

**_Stats (first number is for base tower; second number is for upgraded tower):_**
```
Range 				70	/ 100
Damage				30	/ 40
Armor piercing		65%	/ 90%
Rate of Fire		1	/ 1
Area of damage		15	/ 25
Cost 				300
Cost to upgrade		700
```

**_Special:_**

AOE: the damage is applied to all units in the Area of damage.

---
### **Sniper Tower**

**_Good:_**
* High Damage
* High Range

**_Bad:_**
* No armor piercing
* Low fire rate

**_Stats (first number is for base tower; second number is for upgraded tower):_**
```
Range				120	/ 150
Damage				45	/ 60
Armor Piercing		0%	/ 0%
Rate of Fire		0.5	/ 0.75
Cost				200
Cost to Upgrade		500
```

---
