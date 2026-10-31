class_name FireArea extends Area2D

@export var progress_bar: ProgressBar
@export var duration_timer: Timer
@export var duration: float = 5
@export var effects: Array[Effect]

func _ready() -> void:
	duration_timer.wait_time = duration
	duration_timer.start()
	progress_bar.max_value = duration
	
func _process(_delta: float) -> void:
	progress_bar.value = duration_timer.time_left

func _on_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	var effects_component: StatusEffectsComponent = body.get_node_or_null("StatusEffectsComponent")
	if effects_component:
		for effect in effects:
			effects_component.add_effect(effect.duplicate())
