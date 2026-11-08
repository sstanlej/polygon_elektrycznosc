class_name SoakEffect extends DamageEffect

func on_apply(target_creature: Creature) -> void:
	override_effects.append("burn")
	override_effects.append(BurnEffect.new())
	hurt_cooldown= 3
	modulate_r = 0
	modulate_g = 1
	modulate_b = 1
	super.on_apply(target_creature)
