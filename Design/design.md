# 1. Game Design Document (GDD)

> **Project:** Wizards mayhem
> **Version:** 0.314
> **Status:** Draft  
> **Last Updated:** YYYY-MM-DD  
> **Author(s):** elektrycznosc

# 2. Overview
## 2.1. High Concept
You are a mage that fights robots' invasion. You use elemental magic spells to influence the environment to destroy your enemies.

## 2.2. Elevator Pitch
1. You can make interesting combos with your spells.
2. You have to think a few steps ahead.
3. Satisfying combat

## 2.3. Vision Statement
Destroying horde with spell combos and environment.

## 2.4. Design Pillars
1. **[Pillar 1]:** Elemental spell queue
2. **[Pillar 2]:** Waves of enemies
3. **[Pillar 3]:** Comboing spells

# 3. Game Pillars and Goals
## 3.1. Player Fantasy
We want to stop robots' invasion.

## 3.2. Player Goals
- **Short-term:** Setup combos to kill robots
- **Mid-term:** Survive wave, upgrade yourself
- **Long-term:** Stop ivasion

## 3.3. Non-Goals
Direct combat with enemies

# 4. Core Gameplay
## 4.1. Core Gameplay Loop
1. Start wave
2. Enemies spawn, you have to cast spell combos to kill them
3. Satisfying robot kills with combos
4. Upgrade yourself with drops from enemies
5. Next wave

## 4.2. Controls
| Action | Keyboard / Mouse | Controller | Touch |
|---|---|---|---|
| Move | W A S D | | |
| Interact | Space/E | | |
| Primary action | M1 Spell1 | | |
| Secondary action | M2 Spell2 | | |
| Pause | ESC | | |

## 4.3. Player Actions
- **Movement:** Walking
- **Interaction:** ~ (potentially interacting with shop/environment???)
- **Combat / challenge:** Creating / modifying environment by casting spells
- **Traversal:** Walking
- **Progression:** Beating waves, upgrades

## 4.4. Game Rules
- **Rules**:
- **Restrictions**: Number of orb slots, time of orb regeneration
- **Failure states**: Death of a player, (potentially protect altar??)
- **Edge cases**:

## 4.5. Difficulty and Challenge
   - **Difficulty curve**: Tougher enemies thruought waves
   - **Checkpoints**: NO
   - **Assist options**: RNG with guaranted drops safeguard
   - **Balancing rules** -

# 5. Mechanics and Systems
## 5.1. Mechanics Overview
    Player can cast spells using orbs to alternate environment, which can result in destroying enemies.

    Alternating environment is often equall to creating tiles of certain elements. For more look at section 8.3.

## 5.2. Fire Spells
### 5.2.1. Basic spell - "Ignite"
    Ignite spell creates single fire tile on designated world tile. 

### 5.2.2. Advanced spell - "Ring of flames"
    Creates ring of flames, circullar-like firewall. 
    Different upgrades can modify its form (ex. to square, X etc.).

### 5.2.3. Advanced spell - "Fire mine"
    Fire mine spell creates mine that explodes on contact with enemy.

### 5.2.4. Advanced spell - "Wildfire"
    An area that has randomly appearing tiles of fire that deal damage to enemies.

## 5.3. Water Spells
### 5.3.1. Basic spell - "Lake"
    Creates singular water tile. 
### 5.3.2. Advanced spell - "River"
    Creates water tiles in random direction forming river-like curved line.

## 5.4. Earth Spells DRAFT
### 5.4.1. Basic spell - "Wall"
    Creates singular earth tile.
### 5.4.2. Advanced spell - "Hole"
    Creates singular hole tile.
### 5.4.3. Advanced spell - "Terraform"
    Creates vertical or horizontal line of earth tiles.
    Optionally terraform could be casted in form of circle.
### 5.4.4. Advanced spell - "Earthquake"
    Casts "Hole" and "Wall" at random in certain area.

## 5.5. Air Spells DRAFT
### 5.5.1. Basic spell - "Blowback"
    Knockbacks target one tile away from player.
### 5.5.2. Advanced spell - "Tornado"
    Sucks enemies in and creates wind tiles.
### 5.5.3. Advanced spell - "Cloud"
    Creates wind tiles in certain area.


## 5.6. Spells interactions DRAFT
### 5.6.1. "Hole" + "Lake" 
    Fills previously created hole with water potentially making damage to enemies.
### 5.6.2. "Hole" + "Blowback" 
    Can push target into hole potentially trapping it there.
### 5.6.3. "Hole" + "Tornado"  
    Can suck enemy into hole.
### 5.6.4. "Wall" + "Blowback"  
    Knockbacks earth wall one tile away ??damaging enemy when colliding with it??. It also can be knockbacked into hole to fill it and suffocate enemy with dirt.

### 5.6.5. "Fire Mine" + "Blowback"  
    Knockbacks enemy into fire mine, which results in explosion and damage to mentioned enemy.

## 5.7. Sacrificing orbs
    Additionaly to casting spells player can "sacrifice" orb to get passive effects such as healing, becoming invisible etc.

### 5.7.1. Fire orb:
    Player can slightly boost dmg of fire tiles.

### 5.7.2. Water orb:
    Player can heal himself

### 5.7.3. Earth orb:
    Player can get armor that lasts X seconds

### 5.7.4. Air orb:
    Player can become invisible for X seconds

## 5.8. Combat / Conflict
Enemies have different attacks with different range

## 5.9. Health and Resources
Passive health regeneration

## 5.10. Inventory and Equipment
Basic 4 orb slots, wallet

## 5.11. Economy and Rewards
Collectibles from enemies with which you can buy upgrades

## 5.12. AI and NPC Behavior
Enemies TODO

## 5.13. Saving and Loading
NO

# 6. Progression and Content
## 6.1. Progression Structure
Waves

## 6.2. Player Progression
Statistics updates

## 6.3. Rewards
Enemies drops currency with which you can buy upgrades.
Chests with random items.

## 6.4. Content List TODO
| ID | Content | Description | Status | Priority |
|---|---|---|---|---|
| C-001 | [Content] | | Planned | Must-have |

## 6.5. Replayability
Every run is random, you can drop random items, random enemies types spawn.

# 7. World and Narrative TODO
## 7.1. Setting 
Bad robots invade wizard's realm, he defends it.

## 7.2. Story Summary
[Beginning, middle, ending, and major turning points.]

## 7.3. Characters
| Character | Role | Motivation | Arc |
|---|---|---|---|
| [Name] | | | |

## 7.4. Factions and Relationships
[Groups, alliances, conflicts, and reputation systems.]

## 7.5. Dialogue and Narrative Delivery
[Cutscenes, environmental storytelling, dialogue, journals, etc.]

## 7.6. Lore and Terminology
[Important history, concepts, names, and vocabulary.]

# 8. Level and Mission Design TODO
## 8.1. Level Design Principles
[Guidelines for layout, pacing, navigation, and exploration.]

## 8.2. Level / Mission Template
- **Name / ID:**
- **Purpose:**
- **Player objective:**
- **Starting conditions:**
- **Main challenges:**
- **Key encounters:**
- **Rewards:**
- **Completion conditions:**
- **Failure conditions:**
- **Estimated duration:**

## 8.3. World Layout
World is divided into tiles. There are different types of tiles.

### 8.3.1. Fire tiles:
    Damage enemies and apply burn (dmg over time).
### 8.3.2. Water tiles:
    Damage enemies and apply slownewss.

    Heal player slowly overtime.
### 8.3.3. Wind tiles:
    Slow enemies and periodically push them in random directions.
### 8.3.4. Earth tiles:
    Block paths (probably in form blocks of dirt).
### 8.3.5. Hole tiles:
    Enemies can fall inside it.
### 8.3.6. (Optional) Sandstorm tiles:
    Damage and slow enemies and make player invisible.

    Spread to connecting wind tiles.
### 8.3.7. (Optional) Rain tiles:
    Slow and damage enemies and heal the player (similar to water).

    Spread to connecting wind tiles.


## 8.4. Pacing
[Intensity, downtime, narrative beats, and difficulty rhythm.]

# 9. User Interface and UX 

## 9.1. HUD
Orb slots, health bar, enemies health bars, currency amount, chosen items

## 9.2. Menus and Screens
- Main menu
- Pause menu
- Settings
- ???minimap??? EVENTUALY
- ??? altar/shop indicator ??? EVENTUALY
- ??? Shop ???
- Game over

## 9.3. User Flows
1. Launch game
2. Start run
3. Wave X
4. Survive wave
5. Upgrade
6. Die
7. Reapeat / Quit

# 10. Art Direction TODO Daisy
## 10.1. Visual Style
[Art references, mood, palette, shapes, materials, and composition.]

## 10.2. 10.2.Character Art
[Silhouettes, proportions, animations, costumes, and variations.]

## 10.3. Environment Art
[Architecture, terrain, props, lighting, and atmosphere.]

## 10.4. VFX
[Combat effects, weather, particles, feedback, and transitions.]

## 10.5. Animation
[Locomotion, interactions, combat, cinematics, and facial animation.]

## 10.6. Art Asset List
| Asset ID | Description | Reference | Priority | Status |
|---|---|---|---|---|
| A-001 | | | Must-have | Planned |

# 11. Audio Design
## 11.1. Music
Electronic (genres: EDM, hyperpop, electropop, ambient)

## 11.2. Sound Effects
Created with synthetizers

## 11.3. Voice and Dialogue
Even if, by doodling. Animal crossing 4example

## 11.4. Audio Accessibility
Volume controls

# 12. Technical Design
## 12.1. Technology Stack
- **Engine: Godot 4.7.2**
- **Programming language: GDScript**
- **Version control: git, git-lfs**

## 12.2. Architecture TODO
[Major systems, modules, dependencies, and data flow.]

# 13. Production Plan
## 13.1. Team and Responsibilities
| Role | Owner |
|---|---|
| Game Design | Sulik/szymandus |
| Programming | Everyone |
| Art | Daisy/Sulik | 
| Audio | szymandus/sstanlej |
| QA | Sulik |



## 13.2. Definition of Done
Core gameplay with 4 elements featuring waves, few enemies to kill with boss, by influencing environment with spells. Basic art and music. Main menu.


# 14. Document Maintenance
- **Current version:** 0.31415926
- **Last reviewed:** 2026-10-25
- **Next review:** 2026-10-?
- **Change summary:** XD