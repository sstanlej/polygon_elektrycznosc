# 1. Game Design Document (GDD)

> **Project:** Wizards mayhem
> **Author(s):** elektrycznosc

# 2. Overview
![Current concept art](./img/ui_concept_1.png)
## 2.1. High Concept
You are a mage that fights waves of robots. You use elemental magic spells to influence the environment to destroy your enemies.

## 2.2. Design Pillars
1. **[Pillar 1]:** Elemental spell queue
2. **[Pillar 2]:** Waves of enemies
3. **[Pillar 3]:** Comboing spells
4. **[Pillar 4]:** Player should not be able to kill enemies directly

# 3. Current Milestone
Core gameplay with at least one spell to cast. Basic art and music. Main menu.

# 4. Player Fantasy
Player cannot resist, but cast another spell combo. It is just too satisfying.

# 5. Core Gameplay
## 5.1. Core Gameplay Loop
1. Start wave
2. Enemies spawn, you have to cast spell combos to kill them
3. Satisfying robot kills with combos
4. Upgrade yourself with drops from enemies
5. Next wave

## 5.2. Controls
| Action | Keyboard / Mouse |
|---|---|
| Move | W A S D |
| Interact | Space/E |
| Primary action | M1 Spell1 |
| Secondary action | M2 Spell2 |
| Pause | ESC |

## 5.3. Player Actions
- **Movement:** Walking
- **Interaction:** ~ (potentially interacting with shop/environment???)
- **Combat / challenge:** Creating / modifying environment by casting spells

# 6. Mechanics and Systems
## 6.1. Mechanics Overview
    Player can cast spells using orbs to alternate environment, which can result in destroying enemies.

    Alternating environment is often equall to creating tiles of certain elements. For more look at section 8.3.

## 6.2. Fire Spells
### 6.2.1. Basic spell - "Ignite"
    Ignite spell creates single fire tile on designated world tile. 

### 6.2.2. Advanced spell - "Ring of flames"
    Creates ring of flames, circullar-like firewall. 
    Different upgrades can modify its form (ex. to square, X etc.).

### 6.2.3. Advanced spell - "Fire mine"
    Fire mine spell creates mine that explodes on contact with enemy.

### 6.2.4. Advanced spell - "Wildfire"
    An area that has randomly appearing tiles of fire that deal damage to enemies.

## 6.3. Water Spells
### 6.3.1. Basic spell - "Lake"
    Creates singular water tile. 
### 6.3.2. Advanced spell - "River"
    Creates water tiles in random direction forming river-like curved line.

## 6.4. Earth Spells DRAFT
### 6.4.1. Basic spell - "Wall"
    Creates singular earth tile.
### 6.4.2. Advanced spell - "Hole"
    Creates singular hole tile.
### 6.4.3. Advanced spell - "Terraform"
    Creates vertical or horizontal line of earth tiles.
    Optionally terraform could be casted in form of circle.
### 6.4.4. Advanced spell - "Earthquake"
    Casts "Hole" and "Wall" at random in certain area.

## 6.5. Air Spells DRAFT
### 6.5.1. Basic spell - "Blowback"
    Knockbacks target one tile away from player.
### 6.5.2. Advanced spell - "Tornado"
    Sucks enemies in and creates wind tiles.
### 6.5.3. Advanced spell - "Cloud"
    Creates wind tiles in certain area.


## 6.6. Spells interactions DRAFT
### 6.6.1. "Hole" + "Lake" 
    Fills previously created hole with water potentially making damage to enemies.
### 6.6.2. "Hole" + "Blowback" 
    Can push target into hole potentially trapping it there.
### 6.6.3. "Hole" + "Tornado"  
    Can suck enemy into hole.
### 6.6.4. "Wall" + "Blowback"  
    Knockbacks earth wall one tile away ??damaging enemy when colliding with it??.
    It also can be knockbacked into hole to fill it and suffocate enemy with dirt.

### 6.6.5. "Fire Mine" + "Blowback"  
    Knockbacks enemy into fire mine, which results in explosion and damage to mentioned enemy.

## 6.7. Sacrificing orbs
    Additionaly to casting spells player can "sacrifice" orb to get passive effects such as healing, becoming invisible etc.

### 6.7.1. Fire orb:
    Player can slightly boost dmg of fire tiles.

### 6.7.2. Water orb:
    Player can heal himself

### 6.7.3. Earth orb:
    Player can get armor that lasts X seconds

### 6.7.4. Air orb:
    Player can become invisible for X seconds

## 6.8. Combat / Conflict
Enemies have different attacks with different range

## 6.9. Inventory and Equipment
Basic 4 orb slots, wallet

## 6.10. Economy and Rewards
Collectibles from enemies with which you can buy upgrades

# 7. Progression and Content
## 7.1. Progression Structure
Waves

## 7.2. Player Progression
Statistics updates

## 7.3. Rewards
Enemies drops currency with which you can buy upgrades.
Chests with random items.

## 7.4. Replayability
Every run is random, you can drop random items, random enemies types spawn.

# 8. Level and Mission Design TODO

## 8.1. World Layout
World is divided into tiles. There are different types of tiles.

### 8.1.1. Fire tiles:
    Damage enemies and apply burn (dmg over time).
### 8.1.2. Water tiles:
    Damage enemies and apply slownewss.

    Heal player slowly overtime.
### 8.1.3. Wind tiles:
    Slow enemies and periodically push them in random directions.
### 8.1.4. Earth tiles:
    Block paths (probably in form blocks of dirt).
### 8.1.5. Hole tiles:
    Enemies can fall inside it.
### 8.1.6. (Optional) Sandstorm tiles:
    Damage and slow enemies and make player invisible.

    Spread to connecting wind tiles.
### 8.1.7. (Optional) Rain tiles:
    Slow and damage enemies and heal the player (similar to water).

    Spread to connecting wind tiles.

# 9. User Interface and UX 

## 9.1. HUD
Orb slots, health bar, enemies health bars, currency amount, chosen items (like in the binding of isaac)

## 9.2. Menus and Screens
- Main menu
- Pause menu
- Settings
- ???minimap??? EVENTUALY
- ??? altar/shop indicator ??? EVENTUALY
- ??? Shop ???
- Game over

# 10. Art Direction TODO Daisy
## 10.1. Visual Style
[Art references, mood, palette, shapes, materials, and composition.]

## 10.2. Character Art
[Silhouettes, proportions, animations, costumes, and variations.]

## 10.3. Environment Art
[Architecture, terrain, props, lighting, and atmosphere.]

## 10.4. VFX
[Combat effects, weather, particles, feedback, and transitions.]

## 10.5. Animation
[Locomotion, interactions, combat, cinematics, and facial animation.]

# 11. Audio Design
## 11.1. Music
Electronic (genres: EDM, hyperpop, electropop, ambient)

## 11.2. Sound Effects
Created with synthetizers

## 11.3. Voice and Dialogue
Even if, by doodling. Animal crossing 4example

## 11.4. Audio Accessibility
Volume controls

# 12. Tech stack
- **Engine: Godot 4.7.2**
- **Programming language: GDScript**
- **Version control: git, git-lfs**