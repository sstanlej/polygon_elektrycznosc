class_name WorldEffect extends Node2D

@export var effect_name: String = "Default World Effect"
@export var progress_bar: ProgressBar
@export var duration_timer: Timer
@export var duration: float = 5

var grid_coords: Vector2i = Vector2i.ZERO

func _ready() -> void:
	duration_timer.wait_time = duration
	duration_timer.start()
	progress_bar.max_value = duration
	
func _process(_delta: float) -> void:
	progress_bar.value = duration_timer.time_left

func set_grid_coords(new_grid_coords: Vector2i) -> void:
	grid_coords = new_grid_coords

func restart() -> void:
	duration_timer.start()

func _on_timer_timeout() -> void:
	EventBus.world_effect_expired.emit(self, grid_coords)
	queue_free()
