class_name Effect extends Resource

@export var name: String = "default"
@export var duration: float = 5
var time_left: float = 5
var target: Creature

func on_apply(_target_creature: Creature) -> void:
	time_left = duration

func on_tick(_delta: float, _target_creature: Creature) -> void:
	pass

func on_remove(_target_creature: Creature) -> void:
	pass

func on_refresh(_target_creature: Creature) -> void:
	time_left = duration
