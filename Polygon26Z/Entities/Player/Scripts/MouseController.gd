extends Node2D

@export var tile_highlight: Sprite2D
var ground_layer: TileMapLayer
var target_tile: Vector2i
var target_tile_center: Vector2

func _ready() -> void:
	ground_layer = get_tree().get_first_node_in_group("GroundLayer")

func _process(_delta: float) -> void:
	update_target_tile()
	if Input.is_action_just_pressed("Spell1"):
		EventBus.spell1_clicked.emit(target_tile_center)
	if Input.is_action_just_pressed("Spell2"):
		EventBus.spell2_clicked.emit(target_tile_center)

func update_target_tile() -> void:
	var mouse_world: Vector2 = get_global_mouse_position()
	target_tile= ground_layer.local_to_map(mouse_world)
	target_tile_center = ground_layer.map_to_local(target_tile)
	tile_highlight.global_position = target_tile_center

#func _input(event) -> void:
	#if event is InputEventMouseMotion:
		#print("Mouse motion at: ", event.position)
