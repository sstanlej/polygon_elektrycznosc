class_name StatModifierBehavior extends EffectBehavior

@export var stat_type: StatusEffectsComponent.StatType
@export var modifier: float = 1 # do not set to zero

func on_apply(_instance: ActiveEffect, target: Creature) -> void:
	var effects_component: StatusEffectsComponent = target.get_node_or_null("StatusEffectsComponent")
	if effects_component:
		effects_component.add_stat_multiplier(stat_type, modifier)

func on_remove(_instance: ActiveEffect, target: Creature) -> void:
	var effects_component: StatusEffectsComponent = target.get_node_or_null("StatusEffectsComponent")
	if effects_component:
		effects_component.remove_stat_multiplier(stat_type, modifier)