class_name StatusEffectsComponent extends Node

var effects: Array[Effect]
var target: Creature

func _ready() -> void:
	target = get_parent() as Creature

func _process(delta: float) -> void:
	# Iterating from the back to avoid skipping indexes after removing an effect
	for i in range(effects.size() - 1, -1, -1): 
		var effect = effects[i]
		effect.time_left -= delta
		effect.on_tick(delta, target)
		if effect.time_left <= 0:
			effect.on_remove(target)
			effects.remove_at(i)

func add_effect(new_effect: Effect) -> void:
	for effect in effects:
		if effect.name == new_effect.name:
			effect.on_refresh(target)
			return
	effects.append(new_effect)
	new_effect.on_apply(target)
