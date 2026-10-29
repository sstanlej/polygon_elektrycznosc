class_name MovementController extends Node
var direction: Vector2 = Vector2.ZERO
@export var player: Player
var movement_speed: float = 300

func process_movement(delta) -> void:
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	player.velocity = input_direction * movement_speed
	player.move_and_slide()
	
