# 1. Game Design Document (GDD)

> **Project:** Wizards mayhem
> **Version:** 0.314
> **Status:** Draft  
> **Last Updated:** YYYY-MM-DD  
> **Author(s):** elektrycznosc

# 2. Preamble
    To not have HEADACHE while browsing this document it is advised to install "Markdown - All in One" extension is VSC 
    or view it in Github.

# 3. Overview
## 3.1. High Concept
You are a mage that fights robots' invasion. You use elemental magic spells to influence the environment to destroy your enemies.

## 3.2. Elevator Pitch
1. You can make interesting combos with your spells.
2. You have to think a few steps ahead.
3. Satisfying combat

## 3.3. Vision Statement
Destroying horde with spell combos and environment.

## 3.4. Design Pillars
1. **[Pillar 1]:** Elemental spell queue
2. **[Pillar 2]:** Waves of enemies
3. **[Pillar 3]:** Comboing spells

# 4. Game Pillars and Goals
## 4.1. Player Fantasy
We want to stop robots' invasion.

## 4.2. Player Goals
- **Short-term:** Setup combos to kill robots
- **Mid-term:** Survive wave, upgrade yourself
- **Long-term:** Stop ivasion

## 4.3. Non-Goals
Direct combat with enemies

# 5. Core Gameplay
## 5.1. Core Gameplay Loop
1. Start wave
2. Enemies spawn, you have to cast spell combos to kill them
3. Satisfying robot kills with combos
4. Upgrade yourself with drops from enemies
5. Next wave

## 5.2. Controls
| Action | Keyboard / Mouse | Controller | Touch |
|---|---|---|---|
| Move | W A S D | | |
| Interact | Space/E | | |
| Primary action | M1 Spell1 | | |
| Secondary action | M2 Spell2 | | |
| Pause | ESC | | |

## 5.3. Player Actions
- **Movement:** Walking
- **Interaction:** ~ (potentially interacting with shop/environment???)
- **Combat / challenge:** Creating / modifying environment by casting spells
- **Traversal:** Walking
- **Progression:** Beating waves, upgrades

## 5.4. Game Rules
- **Rules**:
- **Restrictions**: Number of orb slots, time of orb regeneration
- **Failure states**: Death of a player, (potentially protect altar??)
- **Edge cases**:

## 5.5. Difficulty and Challenge
   - **Difficulty curve**: Tougher enemies thruought waves
   - **Checkpoints**: NO
   - **Assist options**: RNG with guaranted drops safeguard
   - **Balancing rules** -

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

## 6.9. Health and Resources
Passive health regeneration

## 6.10. Inventory and Equipment
Basic 4 orb slots, wallet

## 6.11. Economy and Rewards
Collectibles from enemies with which you can buy upgrades

## 6.12. AI and NPC Behavior
Enemies TODO

## 6.13. Saving and Loading
NO

# 7. Progression and Content
## 7.1. Progression Structure
Waves

## 7.2. Player Progression
Statistics updates

## 7.3. Rewards
Enemies drops currency with which you can buy upgrades.
Chests with random items.

## 7.4. Content List TODO
| ID | Content | Description | Status | Priority |
|---|---|---|---|---|
| C-001 | [Content] | | Planned | Must-have |

## 7.5. Replayability
Every run is random, you can drop random items, random enemies types spawn.

# 8. World and Narrative TODO
## 8.1. Setting 
Bad robots invade wizard's realm, he defends it.

## 8.2. Story Summary
[Beginning, middle, ending, and major turning points.]

## 8.3. Characters
| Character | Role | Motivation | Arc |
|---|---|---|---|
| [Name] | | | |

## 8.4. Factions and Relationships
[Groups, alliances, conflicts, and reputation systems.]

## 8.5. Dialogue and Narrative Delivery
[Cutscenes, environmental storytelling, dialogue, journals, etc.]

## 8.6. Lore and Terminology
[Important history, concepts, names, and vocabulary.]

# 9. Level and Mission Design TODO
## 9.1. Level Design Principles
[Guidelines for layout, pacing, navigation, and exploration.]

## 9.2. Level / Mission Template
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

## 9.3. World Layout
World is divided into tiles. There are different types of tiles.

### 9.3.1. Fire tiles:
    Damage enemies and apply burn (dmg over time).
### 9.3.2. Water tiles:
    Damage enemies and apply slownewss.

    Heal player slowly overtime.
### 9.3.3. Wind tiles:
    Slow enemies and periodically push them in random directions.
### 9.3.4. Earth tiles:
    Block paths (probably in form blocks of dirt).
### 9.3.5. Hole tiles:
    Enemies can fall inside it.
### 9.3.6. (Optional) Sandstorm tiles:
    Damage and slow enemies and make player invisible.

    Spread to connecting wind tiles.
### 9.3.7. (Optional) Rain tiles:
    Slow and damage enemies and heal the player (similar to water).

    Spread to connecting wind tiles.


## 9.4. Pacing
[Intensity, downtime, narrative beats, and difficulty rhythm.]

# 10. User Interface and UX 

## 10.1. HUD
Orb slots, health bar, enemies health bars, currency amount, chosen items

## 10.2. Menus and Screens
- Main menu
- Pause menu
- Settings
- ???minimap??? EVENTUALY
- ??? altar/shop indicator ??? EVENTUALY
- ??? Shop ???
- Game over

## 10.3. User Flows
1. Launch game
2. Start run
3. Wave X
4. Survive wave
5. Upgrade
6. Die
7. Reapeat / Quit

# 11. Art Direction TODO Daisy
## 11.1. Visual Style
[Art references, mood, palette, shapes, materials, and composition.]

## 11.2. 10.2.Character Art
[Silhouettes, proportions, animations, costumes, and variations.]

## 11.3. Environment Art
[Architecture, terrain, props, lighting, and atmosphere.]

## 11.4. VFX
[Combat effects, weather, particles, feedback, and transitions.]

## 11.5. Animation
[Locomotion, interactions, combat, cinematics, and facial animation.]

## 11.6. Art Asset List
| Asset ID | Description | Reference | Priority | Status |
|---|---|---|---|---|
| A-001 | | | Must-have | Planned |

# 12. Audio Design
## 12.1. Music
Electronic (genres: EDM, hyperpop, electropop, ambient)

## 12.2. Sound Effects
Created with synthetizers

## 12.3. Voice and Dialogue
Even if, by doodling. Animal crossing 4example

## 12.4. Audio Accessibility
Volume controls

# 13. Technical Design
## 13.1. Technology Stack
- **Engine: Godot 4.7.2**
- **Programming language: GDScript**
- **Version control: git, git-lfs**

## 13.2. Architecture TODO
[Major systems, modules, dependencies, and data flow.]

# 14. Production Plan
## 14.1. Team and Responsibilities
| Role | Owner |
|---|---|
| Game Design | Sulik/szymandus |
| Programming | Everyone |
| Art | Daisy/Sulik | 
| Audio | szymandus/sstanlej |
| QA | Sulik |



## 14.2. Definition of Done
Core gameplay with 4 elements featuring waves, few enemies to kill with boss, by influencing environment with spells. Basic art and music. Main menu.


# 15. Document Maintenance
- **Current version:** 0.31415926
- **Last reviewed:** 2026-10-25
- **Next review:** 2026-10-?
- **Change summary:** XD