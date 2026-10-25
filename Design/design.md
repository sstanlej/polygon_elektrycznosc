# Game Design Document (GDD)

> **Project:** Wizards mayhem
> **Version:** 0.314
> **Status:** Draft  
> **Last Updated:** YYYY-MM-DD  
> **Author(s):** elektrycznosc

## 1. Overview
### 1.1 High Concept
You are a mage that fights robots' invasion. You use elemental magic spells to influence the environment to destroy your enemies.

### 1.2 Elevator Pitch
1. You can make interesting combos with your spells.
2. You have to think a few steps ahead.
3. Satisfying combat

### 1.3 Vision Statement
Destroying horde with spell combos and environment.

### 1.4 Design Pillars
1. **[Pillar 1]:** Elemental spell queue
2. **[Pillar 2]:** Waves of enemies
3. **[Pillar 3]:** Comboing spells

## 2. Game Pillars and Goals
### 2.1 Player Fantasy
We want to stop robots' invasion.

### 2.2 Player Goals
- **Short-term:** Setup combos to kill robots
- **Mid-term:** Survive wave, upgrade yourself
- **Long-term:** Stop ivasion

### 2.4 Non-Goals
Direct combat with enemies

## 3. Core Gameplay
### 3.1 Core Gameplay Loop
1. Start wave
2. Enemies spawn, you have to cast spell combos to kill them
3. Satisfying robot kills with combos
4. Upgrade yourself with drops from enemies
5. Next wave

### 3.2 Controls
| Action | Keyboard / Mouse | Controller | Touch |
|---|---|---|---|
| Move | W A S D | | |
| Interact | Space/E | | |
| Primary action | M1 Spell1 | | |
| Secondary action | M2 Spell2 | | |
| Pause | ESC | | |

### 3.3 Player Actions
- **Movement:** Walking
- **Interaction:** ~ (potentially interacting with shop/environment???)
- **Combat / challenge:** Creating / modifying environment by casting spells
- **Traversal:** Walking
- **Progression:** Beating waves, upgrades

### 3.4 Game Rules
Rules:
Restrictions: Number of orb slots, time of orb regeneration
Faiulure states: Death of a player, (potentially protect altar??)
Edge cases:

### 3.5 Difficulty and Challenge
Difficulty curve: Tougher enemies thruought waves
Checkopints: NO
Assist options: RNG with guaranted drops safeguard
Balancing rules -

## 4. Mechanics and Systems
### 4.1 Mechanics Overview
| Mechanic | Description | Input | Outcome | Priority |
|---|---|---|---|---|
| Casting spells | Casting spells to influence environment | Player | Environment change | Must-have |

### 4.2 Combat / Conflict
Enemies have different attacks with different range

### 4.3 Health and Resources
Passive health regeneration

### 4.4 Inventory and Equipment
Basic 4 orb slots, wallet

### 4.5 Economy and Rewards
Collectibles from enemies with which you can buy upgrades

### 4.6 AI and NPC Behavior
Enemies TODO

### 4.7 Saving and Loading
NO

## 5. Progression and Content
### 5.1 Progression Structure
Waves

### 5.2 Player Progression
Statistics updates

### 5.3 Rewards
Enemies drops currency with which you can buy upgrades.
Chests with random items.

### 5.4 Content List TODO
| ID | Content | Description | Status | Priority |
|---|---|---|---|---|
| C-001 | [Content] | | Planned | Must-have |

### 5.5 Replayability
Every run is random, you can drop random items, random enemies types spawn.

## 6. World and Narrative TODO
### 6.1 Setting 
Bad robots invade wizard's realm, he defends it.

### 6.2 Story Summary
[Beginning, middle, ending, and major turning points.]

### 6.3 Characters
| Character | Role | Motivation | Arc |
|---|---|---|---|
| [Name] | | | |

### 6.4 Factions and Relationships
[Groups, alliances, conflicts, and reputation systems.]

### 6.5 Dialogue and Narrative Delivery
[Cutscenes, environmental storytelling, dialogue, journals, etc.]

### 6.6 Lore and Terminology
[Important history, concepts, names, and vocabulary.]

## 7. Level and Mission Design TODO
### 7.1 Level Design Principles
[Guidelines for layout, pacing, navigation, and exploration.]

### 7.2 Level / Mission Template
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

### 7.3 World Layout
[Regions, hubs, routes, gates, landmarks, and connections.]

### 7.4 Pacing
[Intensity, downtime, narrative beats, and difficulty rhythm.]

## 8. User Interface and UX 

### 8.2 HUD
Orb slots, health bar, enemies health bars, currency amount, chosen items

### 8.3 Menus and Screens
- Main menu
- Pause menu
- Settings
- ???minimap??? EVENTUALY
- ??? altar/shop indicator ??? EVENTUALY
- ??? Shop ???
- Game over

### 8.4 User Flows
1. Launch game
2. Start run
3. Wave X
4. Survive wave
5. Upgrade
6. Die
7. Reapeat / Quit

## 9. Art Direction TODO Daisy
### 9.1 Visual Style
[Art references, mood, palette, shapes, materials, and composition.]

### 9.2 Character Art
[Silhouettes, proportions, animations, costumes, and variations.]

### 9.3 Environment Art
[Architecture, terrain, props, lighting, and atmosphere.]

### 9.4 VFX
[Combat effects, weather, particles, feedback, and transitions.]

### 9.5 Animation
[Locomotion, interactions, combat, cinematics, and facial animation.]

### 9.6 Art Asset List
| Asset ID | Description | Reference | Priority | Status |
|---|---|---|---|---|
| A-001 | | | Must-have | Planned |

## 10. Audio Design
### 10.1 Music
Electronic (genres: EDM, hyperpop, electropop, ambient)

### 10.2 Sound Effects
Created with synthetizers

### 10.3 Voice and Dialogue
Even if, by doodling. Animal crossing 4example

### 10.4 Audio Accessibility
Volume controls

## 11. Technical Design
### 11.1 Technology Stack
- **Engine: Godot 4.7.2**
- **Programming language: GDScript**
- **Version control: git, git-lfs**

### 11.2 Architecture TODO
[Major systems, modules, dependencies, and data flow.]

## 13. Production Plan
### 13.1 Team and Responsibilities
| Role | Owner |
|---|---|
| Game Design | Sulik/szymandus |
| Programming | Everyone |
| Art | Daisy/Sulik | 
| Audio | szymandus/sstanlej |
| QA | Sulik |



### 13.4 Definition of Done
Core gameplay with 4 elements featuring waves, few enemies to kill with boss, by influencing environment with spells. Basic art and music. Main menu.


## Document Maintenance
- **Current version:** 0.31415926
- **Last reviewed:** 2026-10-25
- **Next review:** 2026-10-?
- **Change summary:** XD