class_name PeriodicHealthBehavior extends EffectBehavior

enum TargetFilter { ALL, PLAYER_ONLY, ENEMY_ONLY }

@export var amount: int = -1 # negative: damage, positive: healing
@export var interval: float = 1.0
@export var trigger_on_apply: bool = true # if set, the effect triggers instantly after being applied
@export var target_filter: TargetFilter = TargetFilter.ALL

func on_apply(instance: ActiveEffect, target: Creature) -> void:
	if not _is_valid_target(target):
		return
		
	if trigger_on_apply:
		_apply_health_change(target)
    
	instance.behavior_timers[self] = interval

func on_tick(delta: float, instance: ActiveEffect, target: Creature) -> void:
	if not _is_valid_target(target):
		return
		
	if not instance.behavior_timers.has(self):
		instance.behavior_timers[self] = interval
		
	instance.behavior_timers[self] -= delta
	if instance.behavior_timers[self] <= 0.0:
		instance.behavior_timers[self] += interval
		_apply_health_change(target)

func _is_valid_target(target: Creature) -> bool:
	match target_filter:
		TargetFilter.ALL:
			return true
		TargetFilter.PLAYER_ONLY:
			return target is Player
		TargetFilter.ENEMY_ONLY:
			return not (target is Player) # replace with Enemy when Enemy class is created
	return false

func _apply_health_change(target: Creature) -> void:
	var health: HealthComponent = target.get_node_or_null("HealthComponent")
	if not health:
		return
		
	if amount < 0:
		health.take_damage(abs(amount))
	elif amount > 0:
		if health.has_method("heal"):
			health.heal(amount)
		else:
			health.take_damage(-amount)