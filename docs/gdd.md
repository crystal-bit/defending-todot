
# Game Design Document - Untitled Hacktoberfest 2020 game

- [Game Design Document - Untitled Hacktoberfest 2020 game](#game-design-document---untitled-hacktoberfest-2020-game)
- [Pitch](#pitch)
- [Story](#story)
- [Gameplay](#gameplay)
- [Mechanics](#mechanics)
  - [**Towers**](#towers)
    - [**Bunker**](#bunker)
    - [**Missile Tower**](#missile-tower)
    - [**Sniper Tower**](#sniper-tower)
  - [**Enemies**](#enemies)
    - [**Soldier**](#soldier)
    - [**Commando**](#commando)
    - [**Armored Transport**](#armored-transport)
    - [**Tank**](#tank)
    - [**Aircraft**](#aircraft)

# Pitch

TODO

# Story

TODO

# Gameplay

TODO

# Mechanics


## **Towers**

* There are level 1 towers (or base towers) and level 2 towers (or upgraded towers). A level 2 tower can only be built on a base tower.
* Towers fire at enemies within range. They do not spawn troops; they only fire at target.
* Armor piercing represents the percentage of armor ignored when the damage is applied: for example, an armor piercing value of 20% applied to an armor of 10 means that, for purposes of damage calculation, the armor value is only 8.
* There are three types of towers: Bunker, Missile and Sniper Tower.

---
### **Bunker**

**_Good:_**
* Economic tower.
* Applies slow effect on enemies.

**_Bad:_**
* Low range.
* Cannot target flying enemies.

**_Stats (first number is for base tower; second number is for upgraded tower):_**
```
Range 40 | 60
Damage 20 | 30
Armor piercing 20% | 35%
Rate of Fire 2 | 2.5
Slow effect 30% | 50%
Cost 100
Cost to upgrade 300
```
**_Special:_**
Non flying enemies speed is reduced by percentage of slow effect (actual speed – x% of actual speed) when close to the range of the tower by smoke. Smoking is always on.

---
### **Missile Tower**

**_Good:_**
* Armor piercing.
* Area damage.

**_Bad:_**
* High cost.

**_Stats (first number is for base tower; second number is for upgraded tower):_**
```
Range 70 | 100
Damage 30 | 40
Armor piercing 65% | 90%
Rate of Fire 1 | 1
Area of damage 15 | 25
Cost 300
Cost to upgrade 700
```
**_Special:_**
AOE: the damage is applied to all units in the Area of damage.

---
### **Sniper Tower**

**_Good:_**
* High Damage.
* High Range.

**_Bad:_**
* No armor piercing.
* Low fire rate.

**_Stats (first number is for base tower; second number is for upgraded tower):_**
```
Range 120 | 150
Damage 45 | 60
Armor Piercing 0% | 0%
Rate of Fire 0.5 | 0.75
Cost 200
Cost to Upgrade 500
```

---
## **Enemies**
* Enemies start from starting point (spawn point) to the end point (goal) following the level path. They take no action except to following the path.
* There are two generic types of enemies: normal and elite. Elite are stronger than their normal counterparts.
* There are 5 types of enemies: Soldier, Commando, Armored Transport, Tank, Aircraft.
* Aircraft cannot be targeted by the Bunker Tower nor affected by its slowing effect.
* Armored Transport, when destroyed, spawns Soldiers. Elite Armored Transport spawns Elite Soldiers when destroyed.
* Regeneration (Regen) mechanics gives to the unit the ability to regenerate lost hit points (HP) over time. It is represented in the form of hit points per second.

---
### **Soldier**
**_Good:_**
* Usually they are many (in a group).
* Very common unit.

**_Bad:_**
* No armor.

**_Stats (first number is for normal units; second number is for elite units):_**
```
HP 30 | 60
Armor 0 | 0
Regen 0 | 0
Speed 10 | 11
```

---
### **Commando**
**_Good:_**
* High speed.
* High HP.
* They can regenerate hit points.

**_Bad:_**
* No armor.
* Usually they are alone.

**_Stats (first number is for normal units; second number is for elite units):_**
```
HP 80 | 120
Armor 0 | 0
Regen 5 | 18
Speed 20 | 32
```

---
### **Armored Transport**
**_Good:_**
* They spawn Soldier units when destroyed.
* Armored.
* Elite units can regenerate hit points.

**_Bad:_**
* Low HP.

**_Stats (first number is for normal units; second number is for elite units):_**
```
HP 70 | 100
Armor 20 | 35
Regen 0 | 12
Speed 12 | 15
```
**_Special:_**
When destroyed spawns 8 Soldier units; elite spawns 8 Elite Soldier units.

---
### **Tank**
**_Good:_**
* Heavy Armored.
* They can regenerate hit points.
* High HP

**_Bad:_**
* Low speed.

**_Stats (first number is for normal units; second number is for elite units):_**
```
HP 250 | 450
Armor 30 | 45
Regen 5 | 15
Speed 8 | 9
```

---
### **Aircraft**
**_Good:_**
* Flying unit.
* Armored.
* Elite units can regenerate hit points.

**_Bad:_**
* Low Armor.

**_Stats (first number is for normal units; second number is for elite units):_**
```
HP 150 | 300
Armor 10 | 20
Regen 0 | 12
Speed 15 | 17
```
**_Special:_**
Flying unit: cannot be targeted by the Bunker Tower nor affected by its slowing effect.

---
