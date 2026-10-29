class_name HealthComponent extends Node

@onready var body: CharacterBody2D = get_parent()
@export var max_health: int = 5

var health: int
signal player_died

func _ready() -> void:
	health = max_health

func take_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		die()

func die() -> void:
	if body is Player:
		print("Player died")
	body.queue_free()

func _process(_delta) -> void:
	if Input.is_action_just_pressed("Debug"):
		take_damage(1)
