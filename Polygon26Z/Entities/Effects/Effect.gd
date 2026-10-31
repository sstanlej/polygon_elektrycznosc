class_name Effect extends Resource

@export var name: String = "default"
@export var time_left: float = 5
var target: Creature

func on_apply(target: Creature) -> void:
	pass

func on_tick(delta: float, target: Creature) -> void:
	pass

func on_remove(target: Creature) -> void:
	pass
