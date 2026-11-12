class_name ActiveEffect extends RefCounted

var data: EffectData
var time_left: float
# Seperate duration timer for each behaviour
var behavior_timers: Dictionary = {}

func _init(p_data: EffectData) -> void:
	data = p_data
	time_left = data.duration

func apply(target: Creature) -> void:
	for behavior in data.behaviors:
		if behavior:
			behavior.on_apply(self, target)

func tick(delta: float, target: Creature) -> void:
	time_left -= delta
	for behavior in data.behaviors:
		if behavior:
			behavior.on_tick(delta, self, target)

func remove(target: Creature) -> void:
	for behavior in data.behaviors:
		if behavior:
			behavior.on_remove(self, target)

func refresh(target: Creature) -> void:
	time_left = data.duration
	for behavior in data.behaviors:
		if behavior:
			behavior.on_refresh(self, target)