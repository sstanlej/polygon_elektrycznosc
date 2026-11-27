class_name MouseController extends Node2D

@export var tile_highlight: Sprite2D

var ground_layer: TileMapLayer
var target_tile: Vector2i
var target_tile_center: Vector2

func _ready() -> void:
	ground_layer = get_tree().get_first_node_in_group("GroundLayer")

func _process(_delta: float) -> void:
	update_target_tile()

func set_current_orb_sprite(new_texture: Texture2D) -> void:
	if tile_highlight:
		tile_highlight.texture = new_texture

func update_target_tile() -> void:
	if not ground_layer or not tile_highlight:
		return
	var mouse_world: Vector2 = get_global_mouse_position()
	target_tile = ground_layer.local_to_map(ground_layer.to_local(mouse_world))
	target_tile_center = ground_layer.to_global(ground_layer.map_to_local(target_tile))
	tile_highlight.global_position = target_tile_center
