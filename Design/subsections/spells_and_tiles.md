# 1. Tiles

Every tile has its duration time, after which it disappears. Tiles can also disappear upon making contact with target ex. Player/Enemy.

## 1.1. Fire tile:
    Damages target and applies burn (dmg over time).
## 1.2. Water tile:
    Damages enemies and heals the player Xhp/sec.
    Applies slowness to target.

## 1.3. Wind tile:
    Launches target in random direction (up down left right), then Wind tile disappears.
## 1.4. Earth tile:
    Blocks path (probably in form blocks of dirt).
## 1.5. (Optional) Black Hole tile:
    Sucks one target in, then Black Hole tile disappears.
## 1.6. (Optional) Sandstorm tile:
    Makes player invisible.

# 2. Spells

## 2.1. Fire Spells
### 2.1.1. Basic spell - "Ignite"
    Ignite spell creates single fire tile on designated world tile. 

### 2.1.2. Advanced spell - "Ring of flames"
    Creates ring of flames, circullar-like firewall. 
    Different upgrades can modify its form (ex. to square, X etc.).

### 2.1.3. Advanced spell - "Fire mine"
    Fire mine spell creates mine that explodes on contact with enemy.

### 2.1.4. Advanced spell - "Wildfire"
    An area that has randomly appearing tiles of fire that deal damage to enemies.

## 2.2. Water Spells
### 2.2.1. Basic spell - "Lake"
    Creates singular water tile. 
### 2.2.2. Advanced spell - "River"
    Creates water tiles in random direction forming river-like curved line.

## 2.3. Earth Spells DRAFT
### 2.3.1. Basic spell - "Wall"
    Creates singular earth tile.
### 2.3.2. Advanced spell - "Hole"
    Creates singular hole tile.
### 2.3.3. Advanced spell - "Terraform"
    Creates vertical or horizontal line of earth tiles.
    Optionally terraform could be casted in form of circle.
### 2.3.4. Advanced spell - "Earthquake"
    Casts "Hole" and "Wall" at random in certain area.

## 2.4. Air Spells DRAFT
### 2.4.1. Basic spell - "Blowback"
    Knockbacks target one tile away from player.
### 2.4.2. Advanced spell - "Tornado"
    Sucks enemies in and creates wind tiles.
### 2.4.3. Advanced spell - "Cloud"
    Creates wind tiles in certain area.


# 3. Tiles and Spells interactions DRAFT

    If some interaction is not mentioned it means that nothing happens.

## 3.1. Tile X -> Tile X
    Duration of tile is refreshed.

## 3.2. Water tile -> Fire tile
    Water tile replaces fire tile.

## 3.3. "Blowback" -> Fire tile
    Expands Fire tile for one tile in direction of blowback

## 3.3. "Blowback" -> Water tile
    Expands Water tile for one tile in direction of blowback

## Earth tile -> Fire tile
    Earth tile replaces Fire tile

## Earth tile -> Water tile
    Earth tile replaces Water tile

# 4. Sacrificing orbs
    Additionaly to casting spells player can "sacrifice" orb to get passive effects such as healing, becoming invisible etc.

## 4.1. Fire orb:
    Player can slightly boost dmg of fire tiles for X seconds.

## 4.2. Water orb:
    Player can heal himself instantly for some amount of HP.

## 4.3. Earth orb:
    Player can get shield that lasts X seconds.

## 4.4. Air orb:
    Player can dash in direction of a mouse.