class_name GridManager extends Node

@export var world_effects_container: Node
@export var ground_layer: TileMapLayer

func _ready() -> void:
	EventBus.world_effect_casted.connect(on_world_effect_casted)
	EventBus.world_effect_expired.connect(on_world_effect_expired)

func _process(_delta: float) -> void:
	pass

func on_world_effect_casted(effect_scene: PackedScene, grid_coords: Vector2i) -> void:
	var effect_instance = effect_scene.instantiate() as WorldEffect
	var spawn_coords: Vector2 = ground_layer.map_to_local(grid_coords)
	effect_instance.global_position = spawn_coords
	effect_instance.set_grid_coords(grid_coords)
	world_effects_container.add_child(effect_instance)
	print(effect_instance.effect_name, " spawned at ", grid_coords)

func on_world_effect_expired(effect_instance: WorldEffect, grid_coords: Vector2i) -> void:
	print(effect_instance.effect_name, " expired at ", grid_coords)
