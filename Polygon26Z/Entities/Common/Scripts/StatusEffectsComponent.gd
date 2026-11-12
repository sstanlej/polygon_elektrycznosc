class_name StatusEffectsComponent extends Node

enum StatType{MOVEMENT_SPEED, ORB_COOLDOWN}

var active_effects: Array[ActiveEffect] = []
var target: Creature
var target_sprite: Sprite2D

var active_stats_multipliers: Dictionary[StatType, float]

func _ready() -> void:
	target = get_parent() as Creature
	if target:
		target_sprite = target.get_node_or_null("Sprite2D")

func _process(delta: float) -> void:
	if active_effects.is_empty():
		return
		
	var needs_tint_update: bool = false
	
	# iterating from the back due to possible removal of the element in the array
	for i in range(active_effects.size() - 1, -1, -1):
		var effect: ActiveEffect = active_effects[i]
		effect.tick(delta, target)
		
		if effect.time_left <= 0.0:
			effect.remove(target)
			active_effects.remove_at(i)
			needs_tint_update = true
			
	if needs_tint_update:
		_update_visual_tint()

func add_effect(effect_data: EffectData) -> void:
	if not effect_data or not target:
		return
		
	# if the new effect overrides any other effects, remove them
	if not effect_data.removes_tags.is_empty():
		for i in range(active_effects.size() - 1, -1, -1):
			var existing: ActiveEffect = active_effects[i]
			if _has_matching_tag(existing.data.tags, effect_data.removes_tags):
				existing.remove(target)
				active_effects.remove_at(i)
				
	# if the new effect already exists on the target, refresh it
	for existing in active_effects:
		if existing.data.id == effect_data.id:
			existing.refresh(target)
			_update_visual_tint()
			return
			
	# if not, create a new instance of the effect
	var new_effect_instance: ActiveEffect = effect_data.create_instance()
	active_effects.append(new_effect_instance)
	new_effect_instance.apply(target)
	_update_visual_tint()
		
func add_stat_multiplier(stat_type: StatType, value: float) -> void:

	var current_multiplier: float = active_stats_multipliers.get(stat_type, 1)
	active_stats_multipliers.set(stat_type, current_multiplier * value)
	print(target, "'s ", stat_type, " is now ", active_stats_multipliers.get(stat_type, 1))

func remove_stat_multiplier(stat_type: StatType, value: float) -> void:
	var current_multiplier: float = active_stats_multipliers.get(stat_type)
	if value == 0:
		# this should be later changed because we don't know what the stat multiplier was before it was multiplied by zero
		active_stats_multipliers.set(stat_type, 1)
		print(target, "'s ", stat_type, " is now ", active_stats_multipliers.get(stat_type, 1))
		return
	active_stats_multipliers.set(stat_type, current_multiplier / value)
	print(target, "'s ", stat_type, " is now ", active_stats_multipliers.get(stat_type, 1))

func get_stat_multiplier(stat_type: StatType) -> float:
	return active_stats_multipliers.get(stat_type, 1)

func _has_matching_tag(effect_tags: Array[String], tags_to_remove: Array[String]) -> bool:
	for tag in effect_tags:
		if tag in tags_to_remove:
			return true
	return false

func _update_visual_tint() -> void:
	if not target_sprite:
		return
		
	# look for newest effect that has color
	for i in range(active_effects.size() - 1, -1, -1):
		var effect: ActiveEffect = active_effects[i]
		if effect.data.has_tint:
			target_sprite.modulate = effect.data.tint_color
			return
			
	# if none have color, reset color
	target_sprite.modulate = Color.WHITE
