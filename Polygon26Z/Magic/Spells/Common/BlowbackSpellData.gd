class_name BlowbackSpellData extends SpellData

@export var radius: float = 80.0
@export var push_force: float = 760
@export var whiff_effect: EffectData
@export var vfx_scene: PackedScene

func cast(caster: Node2D, target_position: Vector2, grid_manager: GridManager) -> bool:
	if not caster or not grid_manager:
		return false

	var target_cell: Vector2i = grid_manager.world_to_grid(target_position)
	
	if not grid_manager.get_ground_tile(target_cell) or grid_manager.get_wall(target_cell):
		return false

	var push_dir: Vector2 = (target_position - caster.global_position).normalized()
	if push_dir == Vector2.ZERO:
		push_dir = Vector2.RIGHT

	var space_state: PhysicsDirectSpaceState2D = caster.get_world_2d().direct_space_state
	var query := PhysicsShapeQueryParameters2D.new()
	var shape := CircleShape2D.new()
	shape.radius = radius
	
	query.shape = shape
	query.transform = Transform2D(0.0, target_position)
	query.exclude = [caster.get_rid()]
	
	var results: Array[Dictionary] = space_state.intersect_shape(query)
	for result in results:
		var collider: Object = result.get("collider")
		if collider is Creature:
			var movement := collider.get_node_or_null("MovementController") as BaseMovementController
			if movement:
				movement.apply_impulse(push_dir * push_force)
				
			if whiff_effect:
				var effects_comp := collider.get_node_or_null("StatusEffectsComponent") as StatusEffectsComponent
				if effects_comp:
					effects_comp.add_effect(whiff_effect)

	# 3. Interakcja z kafelkami ognia i wody (rozdmuchanie o 1 kratkę w kierunku podmuchu)
	var existing_effect: WorldEffect = grid_manager.get_tile_effect(target_cell)
	if existing_effect and existing_effect.effect_name in ["Fire Area", "Water Area"]:
		var grid_dir: Vector2i
		if abs(push_dir.x) > abs(push_dir.y):
			grid_dir = Vector2i(int(sign(push_dir.x)), 0)
		else:
			grid_dir = Vector2i(0, int(sign(push_dir.y)))
			
		var neighbor_cell: Vector2i = target_cell + grid_dir
		if not existing_effect.scene_file_path.is_empty():
			var effect_scene: PackedScene = load(existing_effect.scene_file_path)
			grid_manager.try_cast_tile_effect(effect_scene, neighbor_cell)

	return true
