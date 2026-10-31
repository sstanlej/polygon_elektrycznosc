class_name HUDManager extends Control

@export var health_bar: ProgressBar
@export var health_label: RichTextLabel

func _ready() -> void:
	EventBus.player_health_changed.connect(update_health_bar)

func update_health_bar(current: int, max_health: int) -> void:
	health_bar.max_value = max_health
	health_bar.value = current
	health_label.text = "%d / %d" % [current, max_health]
	
