class_name GridManager extends Node

signal pathfinding_changed

@export var world_effects_container: Node
@export var ground_layer: TileMapLayer
@export var wall_layer: TileMapLayer
var active_effects: Dictionary[Vector2i, WorldEffect]
var environment_objects: Dictionary[Vector2i, EnvironmentObject] = {}
var astar: AStarGrid2D

func _ready() -> void:
	EventBus.world_effect_casted.connect(on_world_effect_casted)
	EventBus.world_effect_expired.connect(on_world_effect_expired)
	active_effects.clear()
	# removed initialize_astar() method - replaced it with update_astar_region(...) called by world_generator

func _process(_delta: float) -> void:
	pass


func update_astar_region(center_chunk: Vector2i, chunk_size: int, load_radius: int) -> void:
	if not ground_layer or not wall_layer:
		return

	var min_cell: Vector2i = (center_chunk - Vector2i(load_radius, load_radius)) * chunk_size
	var size_in_cells: int = (load_radius * 2 + 1) * chunk_size
	var new_region := Rect2i(min_cell, Vector2i(size_in_cells, size_in_cells))

	if not astar:
		astar = AStarGrid2D.new()
		astar.cell_size = ground_layer.tile_set.tile_size
		astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ONLY_IF_NO_OBSTACLES

	astar.region = new_region
	astar.update()

	for x in range(astar.region.position.x, astar.region.end.x):
		for y in range(astar.region.position.y, astar.region.end.y):
			var cell := Vector2i(x, y)
			if ground_layer.get_cell_source_id(cell) == -1 or wall_layer.get_cell_source_id(cell) != -1:
				astar.set_point_solid(cell, true)

	for coords in active_effects:
		if astar.is_in_boundsv(coords):
			var effect: WorldEffect = active_effects[coords]
			if is_effect_blocking(effect):
				astar.set_point_solid(coords, true)

	for coords in environment_objects:
		if astar.is_in_boundsv(coords):
			var env_obj: EnvironmentObject = environment_objects[coords]
			if env_obj and env_obj.blocks_movement:
				astar.set_point_solid(coords, true)
	
	pathfinding_changed.emit()

func is_effect_blocking(effect: WorldEffect) -> bool:
	if not effect:
		return false
	if effect.blocks_movement:
		return true
	if effect.has_node("StaticBody2D"):
		return true
	return false

func set_cell_solid(cell: Vector2i, solid: bool) -> void:
	if astar and astar.is_in_boundsv(cell):
		astar.set_point_solid(cell, solid)

func is_cell_walkable(cell: Vector2i) -> bool:
	if not astar or not astar.is_in_boundsv(cell):
		return false
	return not astar.is_point_solid(cell)

func world_to_grid(world_pos: Vector2) -> Vector2i:
	if not ground_layer:
		return Vector2i.ZERO
	return ground_layer.local_to_map(ground_layer.to_local(world_pos))

func grid_to_world(cell: Vector2i) -> Vector2:
	if not ground_layer:
		return Vector2.ZERO
	return ground_layer.to_global(ground_layer.map_to_local(cell))

func get_closest_walkable_neighbor(target_cell: Vector2i, origin_cell: Vector2i) -> Vector2i:
	var neighbors: Array[Vector2i] = [
		target_cell + Vector2i.UP,
		target_cell + Vector2i.DOWN,
		target_cell + Vector2i.LEFT,
		target_cell + Vector2i.RIGHT,
		target_cell + Vector2i(-1, -1),
		target_cell + Vector2i(1, -1),
		target_cell + Vector2i(-1, 1),
		target_cell + Vector2i(1, 1)
	]
	var best_cell: Vector2i = Vector2i(-999999, -999999)
	var min_dist: float = INF
	for n in neighbors:
		if is_cell_walkable(n):
			var dist = n.distance_squared_to(origin_cell)
			if dist < min_dist:
				min_dist = dist
				best_cell = n
	return best_cell

func get_path_world(from_pos: Vector2, to_pos: Vector2) -> PackedVector2Array:
	if not astar or not ground_layer:
		return PackedVector2Array()
	
	var from_cell: Vector2i = world_to_grid(from_pos)
	var to_cell: Vector2i = world_to_grid(to_pos)
	
	if not astar.is_in_boundsv(from_cell):
		return PackedVector2Array()
	
	if astar.is_point_solid(from_cell):
		from_cell = get_closest_walkable_neighbor(from_cell, to_cell)
		if from_cell == Vector2i(-999999, -999999):
			return PackedVector2Array()
	
	var target_is_walkable: bool = is_cell_walkable(to_cell)
	if not target_is_walkable:
		to_cell = get_closest_walkable_neighbor(to_cell, from_cell)
		if to_cell == Vector2i(-999999, -999999):
			return PackedVector2Array()
	
	var id_path: Array[Vector2i] = astar.get_id_path(from_cell, to_cell)
	if id_path.is_empty():
		return PackedVector2Array()
	
	# Skip the first tile if the agent is already inside it so the agent moves towards the NEXT tile
	if id_path.size() > 1 and from_cell == world_to_grid(from_pos):
		id_path.remove_at(0)
	
	var world_path: PackedVector2Array = PackedVector2Array()
	for cell in id_path:
		world_path.append(grid_to_world(cell))
	
	if target_is_walkable and world_path.size() > 0:
		world_path[world_path.size() - 1] = to_pos
		
	return world_path

func get_tile_effect(grid_coords: Vector2i) -> WorldEffect:
	return active_effects.get(grid_coords)

func get_wall(grid_coords: Vector2i) -> bool:
	return wall_layer.get_cell_source_id(grid_coords) != -1

func get_ground_tile(grid_coords: Vector2i):
	return ground_layer.get_cell_tile_data(grid_coords)

func try_cast_tile_effect(effect_scene: PackedScene, grid_coords: Vector2i) -> bool:
	if not effect_scene:
		return false
	
	if not get_ground_tile(grid_coords) or get_wall(grid_coords):
		print("Cannot cast here: invalid ground or wall!")
		return false
		
	if environment_objects.has(grid_coords):
		print("Cannot cast here: blocked by environment object!")
		return false
	
	var current_tile_effect: WorldEffect = get_tile_effect(grid_coords)
	if current_tile_effect:
		return try_mix_effects(effect_scene, grid_coords)
	
	on_world_effect_casted(effect_scene, grid_coords)
	return true

func try_mix_effects(new_effect_scene: PackedScene, grid_coords: Vector2i) -> bool:
	var current_effect: WorldEffect = active_effects.get(grid_coords)
	var new_effect: WorldEffect = new_effect_scene.instantiate() as WorldEffect
	print("Trying to place ", new_effect.effect_name, " on ", current_effect.effect_name)
	if new_effect.effect_name == current_effect.effect_name:
		print("Refreshing original effect!")
		current_effect.restart()
		new_effect.queue_free()
		return true
	print("Mix failed")
	new_effect.queue_free()
	return false

func on_world_effect_casted(effect_scene: PackedScene, grid_coords: Vector2i) -> void:
	var effect_instance = effect_scene.instantiate() as WorldEffect
	var spawn_coords: Vector2 = ground_layer.map_to_local(grid_coords)
	effect_instance.global_position = spawn_coords
	effect_instance.set_grid_coords(grid_coords)
	world_effects_container.add_child(effect_instance)
	active_effects.set(grid_coords, effect_instance)
	
	if is_effect_blocking(effect_instance):
		set_cell_solid(grid_coords, true)
		pathfinding_changed.emit()
		
	print(effect_instance.effect_name, " spawned at ", grid_coords)

func on_world_effect_expired(effect_instance: WorldEffect, grid_coords: Vector2i) -> void:
	var was_blocking: bool = is_effect_blocking(effect_instance)
	if active_effects.has(grid_coords):
		active_effects.erase(grid_coords)
		
	if was_blocking and not get_wall(grid_coords):
		set_cell_solid(grid_coords, false)
		pathfinding_changed.emit()
		
	print(effect_instance.effect_name, " expired at ", grid_coords)


func can_place_environment_object(origin_cell: Vector2i, footprint: Vector2i) -> bool:
	for x in range(footprint.x):
		for y in range(footprint.y):
			var cell: Vector2i = origin_cell + Vector2i(x, y)
			if not get_ground_tile(cell) or get_wall(cell):
				return false
			if environment_objects.has(cell) or active_effects.has(cell):
				return false
	return true

func register_environment_object(obj: EnvironmentObject, origin_cell: Vector2i) -> void:
	obj.occupied_cells.clear()
	for x in range(obj.footprint_size.x):
		for y in range(obj.footprint_size.y):
			var cell: Vector2i = origin_cell + Vector2i(x, y)
			obj.occupied_cells.append(cell)
			environment_objects[cell] = obj
			if obj.blocks_movement:
				set_cell_solid(cell, true)
	pathfinding_changed.emit()

func unregister_environment_object(obj: EnvironmentObject) -> void:
	for cell in obj.occupied_cells:
		if environment_objects.get(cell) == obj:
			environment_objects.erase(cell)
		if obj.blocks_movement and not get_wall(cell):
			var effect: WorldEffect = active_effects.get(cell)
			if not is_effect_blocking(effect):
				set_cell_solid(cell, false)
	pathfinding_changed.emit()
