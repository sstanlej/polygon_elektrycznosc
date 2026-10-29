class_name Player extends CharacterBody2D

@export var movement_controller: MovementController

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	movement_controller.process_movement(delta)
