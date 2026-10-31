class_name BurnEffect extends Effect

var hurt_cooldown: float = 1
var hurt_time_left: float = 0
var damage: int = 1
var target_health: HealthComponent

func on_apply(target: Creature) -> void:
	target_health = target.get_node_or_null("HealthComponent")

func on_tick(delta: float, target: Creature) -> void:
	hurt_time_left -= delta
	if hurt_time_left <= 0:
		hurt_time_left = hurt_cooldown
		if target_health:
			target_health.take_damage(1)
