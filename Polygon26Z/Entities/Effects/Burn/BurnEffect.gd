class_name BurnEffect extends Effect

var hurt_cooldown: float = 1
var hurt_time_left: float = 0
var damage: int = 1
var target_health: HealthComponent
var target_sprite: Sprite2D

func on_apply(target: Creature) -> void:
	target_health = target.get_node_or_null("HealthComponent")
	target_sprite = target.get_node_or_null("Sprite2D")
	target_sprite.modulate.g = 0.25
	target_sprite.modulate.b = 0
	super.on_apply(target)

func on_tick(delta: float, target: Creature) -> void:
	hurt_time_left -= delta
	if hurt_time_left <= 0:
		hurt_time_left = hurt_cooldown
		if target_health:
			target_health.take_damage(1)

func on_remove(target: Creature) -> void:
	target_sprite.modulate.g = 1
	target_sprite.modulate.b = 1
