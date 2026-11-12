class_name Effect extends Resource

@export var name: String = "default"
@export var duration: float = 5
@export var override_effects: Array[String]
var time_left: float = 5
var target: Creature

func on_apply(target_creature: Creature) -> void:
	if target_creature:
		var current_effects = target_creature.get_active_effects()
		print("Applying ", self.name, " effect to ", target_creature)
		for effect in current_effects:
			if effect.name in override_effects:
				print(self.name, " should override ", effect.name)
	time_left = duration

func on_tick(_delta: float, _target_creature: Creature) -> void:
	pass

func on_remove(_target_creature: Creature) -> void:
	pass

func on_refresh(_target_creature: Creature) -> void:
	time_left = duration
