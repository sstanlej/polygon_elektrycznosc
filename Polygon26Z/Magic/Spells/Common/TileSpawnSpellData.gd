class_name TileSpawnSpellData extends SpellData

@export var world_effect_scene: PackedScene

func cast(_caster: Node2D, _target_position: Vector2, _grid_manager: GridManager) -> bool:
	if not world_effect_scene:
		print(spell_name, " has no world effect scene!")
		return false
	var grid_coords: Vector2i = _grid_manager.world_to_grid(_target_position)
	return _grid_manager.try_cast_tile_effect(world_effect_scene, grid_coords)
