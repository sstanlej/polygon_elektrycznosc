class_name EnemyMovementController extends Node

@export var movement_speed: float = 50
@onready var body: CharacterBody2D = get_parent()

var player: Player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func get_direction() -> Vector2:
	if not player:
		return Vector2.ZERO
	var direction = player.global_position - body.global_position
	return direction.normalized()
	

func _physics_process(_delta: float) -> void:
	if body:
		body.velocity = get_direction() * movement_speed
		body.move_and_slide()
