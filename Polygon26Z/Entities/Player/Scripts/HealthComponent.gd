class_name HealthComponent extends Node

@onready var body: CharacterBody2D = get_parent()
@export var max_health: int = 5

var health: int

func _ready() -> void:
	health = max_health

func take_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		die()

func die() -> void:
	body.queue_free()
