class_name WorldGenerator extends Node

@export_group("References")
@export var ground_layer: TileMapLayer
@export var overlay_layer: TileMapLayer
@export var grid_manager: GridManager

@export_group("Generation Settings")
@export var chunk_size: int = 20
@export var load_radius: int = 1

@export_group("TileSet Data")
@export var ground_source_id: int = 1
@export var ground_atlas_coords: Vector2i = Vector2i.ZERO
@export var overlay_source_id: int = 2
@export var overlay_atlas_coords: Vector2i = Vector2i.ZERO

var generated_chunks: Dictionary[Vector2i, bool] = {}
var last_player_chunk: Vector2i = Vector2i(-999999, -999999)
var player: Player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func _process(_delta: float) -> void:
	if not player:
		player = get_tree().get_first_node_in_group("Player")
		if not player:
			return
	if not grid_manager:
		return

	var current_chunk: Vector2i = get_chunk_coords(player.global_position)
	if current_chunk != last_player_chunk:
		last_player_chunk = current_chunk
		update_chunks_around(current_chunk)
		grid_manager.update_astar_region(current_chunk, chunk_size, load_radius)

func get_chunk_coords(world_pos: Vector2) -> Vector2i:
	var cell: Vector2i = grid_manager.world_to_grid(world_pos)
	var cx: int = floori(float(cell.x) / chunk_size)
	var cy: int = floori(float(cell.y) / chunk_size)
	return Vector2i(cx, cy)

func update_chunks_around(center_chunk: Vector2i) -> void:
	for x in range(-load_radius, load_radius + 1):
		for y in range(-load_radius, load_radius + 1):
			var chunk_coords: Vector2i = center_chunk + Vector2i(x, y)
			if not generated_chunks.has(chunk_coords):
				generate_chunk(chunk_coords)
				generated_chunks[chunk_coords] = true

func generate_chunk(chunk_coords: Vector2i) -> void:
	var start_x: int = chunk_coords.x * chunk_size
	var start_y: int = chunk_coords.y * chunk_size

	for x in range(start_x, start_x + chunk_size):
		for y in range(start_y, start_y + chunk_size):
			var cell := Vector2i(x, y)
			if ground_layer:
				ground_layer.set_cell(cell, ground_source_id, ground_atlas_coords)
			if overlay_layer:
				overlay_layer.set_cell(cell, overlay_source_id, overlay_atlas_coords)
	print("generated chunk ", chunk_coords)
