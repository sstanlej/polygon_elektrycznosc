class_name DamageEffect extends Effect

var hurt_cooldown: float = 1
var hurt_time_left: float = 0
var damage: int = 1
var target_health: HealthComponent
var target_sprite: Sprite2D
var modulate_r: float = 1
var modulate_g: float = 0.25
var modulate_b: float = 0

func on_apply(target_creature: Creature) -> void:
	target_health = target_creature.get_node_or_null("HealthComponent")
	target_sprite = target_creature.get_node_or_null("Sprite2D")
	target_sprite.modulate.r = modulate_r
	target_sprite.modulate.g = modulate_g
	target_sprite.modulate.b = modulate_b
	super.on_apply(target_creature)

func on_tick(delta: float, _target_creature: Creature) -> void:
	hurt_time_left -= delta
	if hurt_time_left <= 0:
		hurt_time_left = hurt_cooldown
		if target_health:
			target_health.take_damage(1)

func on_remove(_target_creature: Creature) -> void:
	target_sprite.modulate.r = 1
	target_sprite.modulate.g = 1
	target_sprite.modulate.b = 1
