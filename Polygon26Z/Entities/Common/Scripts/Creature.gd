class_name Creature extends CharacterBody2D

#var effects

func get_active_effects() -> Array[Effect]:
	var effects_component: StatusEffectsComponent = get_node_or_null("StatusEffectsComponent")
	if effects_component:
		return effects_component.get_active_effects()
	var effects: Array = []
	return effects
	
