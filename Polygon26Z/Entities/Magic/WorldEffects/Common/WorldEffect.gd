class_name WorldEffect extends Node2D

@export var progress_bar: ProgressBar
@export var duration_timer: Timer
@export var duration: float = 5

var grid_coords: Vector2i

func _ready() -> void:
	duration_timer.wait_time = duration
	duration_timer.start()
	progress_bar.max_value = duration
	
func _process(_delta: float) -> void:
	progress_bar.value = duration_timer.time_left

func _on_timer_timeout() -> void:
	EventBus.world_effect_expired.emit(grid_coords)
	queue_free()
