extends Node2D

var ground_layer: TileMapLayer

func _ready() -> void:
	ground_layer = get_tree().get_first_node_in_group("GroundLayer")


func _process(_delta: float) -> void:
	var mouse_world: Vector2 = get_global_mouse_position()
	var target_tile: Vector2i = ground_layer.local_to_map(mouse_world)
	var tile_center: Vector2 = ground_layer.map_to_local(target_tile)
	global_position = tile_center


#func _input(event) -> void:
	#if event is InputEventMouseMotion:
		#print("Mouse motion at: ", event.position)
