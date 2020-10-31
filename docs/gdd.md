
# Game Design Document - Untitled Hacktoberfest 2020 game

- [Game Design Document - Untitled Hacktoberfest 2020 game](#game-design-document---untitled-hacktoberfest-2020-game)
- [Pitch](#pitch)
- [Story](#story)
- [Gameplay](#gameplay)
    - [**Basic gameplay**](#basic-gameplay)
    - [**Win and Lost condition**](#win-and-lost-condition)
    - [**Levels**](#levels)
    - [**Enemy Waves**](#enemy-waves)
    - [**Money**](#money)
    - [**Towers Building and Management**](#towers-building-and-management)
    - [**Input**](#input)
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

Defend your city by placing towers and destroying enemies!

# Story


Three nations at war, one battlefield, the prosperous and peaceful land of Todog.
The people always find themselves in the midst of battles and their precious land ruined!

BUT NOT ANYMORE!

The cities of Todog have come together and are joining forces to fight back with fire and iron.
No invader will dare to disturb this peaceful land again!

# Gameplay

## **Basic gameplay**
When the game starts, the player can select the level to play: levels are all locked except the first, if this is the first game of the player; later, previous completed levels are selectable.

When the player starts the level, **_Enemies_** start moving towards the **_BaseArea_** of the level, from the **_spawn_** **_point_** following the level **_path_**. They take no action except to following the path.

**_Enemies_** can be destroyed by the **_Towers_** placed by the Player in the level along the **_path_**.

**_Tower_** fires at the **_Enemies_** in range.

If destroyed by the **_Towers_**, enemies release **_Money_**.

If an **_Enemy_** reaches the **_Base_**, it deals **_damage_** to the **_Base_**.


## **Win and Lost condition**
Player starts with 20 **_HP_** for his Base: when the Base reaches 0 **_HP_** the game is lost.

Player wins when there are no more **_enemies_** on the screen (after last **_Wave_**) and the **_Base_** has 1 or more **_HP_** left.

With 20 **_HP_** left, the player wins the level with 3 **_stars_**.

With 10 or more **_HP_** left (but less than 20), the player wins the level with 2 **_stars_**.

With 1 or more **_HP_** left (but less than 10), the player wins the level with 1 **_star_**.


## **Levels**
Each level is made up of, in addition to aesthetic elements, the following elements: a **_base_**, which must be defended by the player, a **_path_** or road that the enemies will follow (which starts from a specific point and reaches the **_base_** ... even more roads, but all must lead to the **_base_**), and **_Strategic Points_** where you can build the **_towers_**.

**_Strategic Points_** are fixed in the level map.


## **Enemy Waves**
**_Enemies_** arrive in **_waves_** and follow the **_path_** defined in the level.

A **_Wave_** is composed by a sequence of **_enemies_** (in a variety of types and numbers of **_enemies_**).

Before each **_Wave_** (including the first) there is a pause: the player must start the wave when ready (by a button for example).

Each level has its own specific **_waves_**, defined in the level design.


## **Money**
The player starts each level with a predefined amount of **_money_**, determined by the specific level (may vary from level to level).

**_Money_** is needed to build **Towers**.

**_Money_** is needed to upgrade **_Towers_**.

If destroyed from the **_Towers_**, **_enemies_** release **_Money_**.

Player can sell **_Towers_** to gain **_money_** back.


## **Towers Building and Management**
**_Towers_** can be built only on **_Strategic Point_** on the level map.

Player must pay the **_tower’s_** cost to build the **_tower_**.

Player can upgrade a level 1 **_tower_** to a level 2 **_tower_**.

**_Towers_** can be sold for 75% of their total cost (base cost + upgrade cost if any): once sold, the **_strategic point_** is free for another **_tower_** to be built.


## **Input**
The player can interact with the game exclusively with the left mouse button or by touch (on mobile devices for example).



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
Range 130 | 170
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
Range 230 | 300
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
* Damage attribute is the damage dealt to the player's base.
* Money attribute is the money dropped by the enemy when destroyed.


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
Damage 1 | 1
Money Dropped 5 | 10
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
Damage 4 | 4
Money Dropped 12 | 20
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
Damage 8 | 8
Money Dropped 10 | 15
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
Damage 10 | 10
Money Dropped 40 | 60
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
Damage 6 | 6
Money Dropped 30 | 50
```
**_Special:_**
Flying unit: cannot be targeted by the Bunker Tower nor affected by its slowing effect.

---
