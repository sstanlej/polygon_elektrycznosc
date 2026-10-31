class_name MovementController extends Node
var direction: Vector2 = Vector2.ZERO

@export var movement_speed: float = 100
@onready var body: CharacterBody2D = get_parent()
@onready var animation_tree: AnimationTree = get_parent().get_node_or_null("AnimationTree")
var movement_dir: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	if body:
		var input_direction = Input.get_vector("Left", "Right", "Up", "Down").normalized()
		body.velocity = input_direction * movement_speed
		body.move_and_slide()
		if input_direction == Vector2.ZERO:
			animation_tree.get("parameters/playback").travel("Idle")
		else:
			animation_tree.get("parameters/playback").travel("Walk")
			animation_tree.set("parameters/Idle/blend_position", input_direction)
			animation_tree.set("parameters/Walk/blend_position", input_direction)
