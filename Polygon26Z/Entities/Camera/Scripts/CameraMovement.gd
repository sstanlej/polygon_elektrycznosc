extends Node2D

@onready var player: Player = get_tree().get_first_node_in_group("Player") as Player
@export var follow_speed: float = 2

func _physics_process(delta: float) -> void:
	if player:
		global_position = global_position.lerp(player.global_position, follow_speed * delta)
		
