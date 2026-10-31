class_name HealthComponent extends Node

@onready var body: CharacterBody2D = get_parent()
@export var max_health: int = 5
signal health_initialized(max_health: int)
signal health_changed(current_health: int, max_health: int)

var health: int

func _ready() -> void:
	health = max_health
	call_deferred("emit_health")

func take_damage(amount: int) -> void:
	health -= amount
	health_changed.emit(health, max_health)
	if health <= 0:
		die()

func die() -> void:
	body.queue_free()

func emit_health() -> void:
	health_initialized.emit(max_health)
