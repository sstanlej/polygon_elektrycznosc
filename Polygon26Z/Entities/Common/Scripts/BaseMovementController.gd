class_name BaseMovementController extends Node

@export var base_movement_speed: float = 600.0
@export var knockback_friction: float = 3000.0

@onready var body: CharacterBody2D = get_parent()
@onready var effects_component: StatusEffectsComponent = body.get_node_or_null("StatusEffectsComponent")

var external_velocity: Vector2 = Vector2.ZERO

func apply_impulse(impulse: Vector2) -> void:
	external_velocity += impulse

func get_current_speed() -> float:
	var movement_speed: float = base_movement_speed
	if effects_component:
		movement_speed *= effects_component.get_stat_multiplier(StatusEffectsComponent.StatType.MOVEMENT_SPEED)
	return movement_speed

func _physics_process(delta: float) -> void:
	if external_velocity != Vector2.ZERO:
		external_velocity = external_velocity.move_toward(Vector2.ZERO, knockback_friction * delta)