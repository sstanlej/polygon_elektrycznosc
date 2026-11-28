class_name EnvironmentObject extends Node2D

@export_group("Grid & Physics")
@export var footprint_size: Vector2i = Vector2i(1, 1)
@export var blocks_movement: bool = true
@export var max_pixel_offset: float = 24.0

@export_group("Destructibility")
@export var is_destructible: bool = false
@export var max_hp: int = 1

var current_hp: int
var origin_cell: Vector2i
var occupied_cells: Array[Vector2i] = []
var grid_manager: GridManager

func _ready() -> void:
	current_hp = max_hp

func setup(p_grid_manager: GridManager, p_origin_cell: Vector2i) -> void:
	grid_manager = p_grid_manager
	origin_cell = p_origin_cell

	var top_left_world: Vector2 = grid_manager.grid_to_world(origin_cell)
	var bottom_right_cell: Vector2i = origin_cell + footprint_size - Vector2i.ONE
	var bottom_right_world: Vector2 = grid_manager.grid_to_world(bottom_right_cell)
	var center_world: Vector2 = (top_left_world + bottom_right_world) * 0.5

	# if the object is bigger than 1x1 cell, reduce the offset
	var effective_offset: float = max_pixel_offset if footprint_size == Vector2i.ONE else max_pixel_offset * 0.5
	var random_offset := Vector2(
		randf_range(-effective_offset, effective_offset),
		randf_range(-effective_offset, effective_offset)
	)

	global_position = center_world + random_offset

func take_damage(amount: int) -> void:
	if not is_destructible:
		return
	current_hp -= amount
	if current_hp <= 0:
		destroy()

func destroy() -> void:
	queue_free()

func _exit_tree() -> void:
	if is_instance_valid(grid_manager):
		grid_manager.unregister_environment_object(self)
