class_name MovementController extends Node
var direction: Vector2 = Vector2.ZERO

@export var movement_speed: float = 100
@onready var body: CharacterBody2D = get_parent()

func _physics_process(delta: float) -> void:
	if body:
		var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
		body.velocity = input_direction * movement_speed
		body.move_and_slide()
