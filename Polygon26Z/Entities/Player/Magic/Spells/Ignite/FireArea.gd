class_name FireArea extends Area2D

@export var progress_bar: ProgressBar
@export var duration_timer: Timer
@export var duration: float = 5
@export var effects: Array[Effect]

var bodies_inside: Array[Node2D]
var refresh_interval: float = 0.5
var refresh_timer: float = 0.0

func _ready() -> void:
	duration_timer.wait_time = duration
	duration_timer.start()
	progress_bar.max_value = duration
	
func _physics_process(delta: float) -> void:
	progress_bar.value = duration_timer.time_left
	refresh_timer -= delta
	if refresh_timer <= 0:
		refresh_timer = refresh_interval
		for body in bodies_inside:
			apply_effects(body)

func _on_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Creature:
		bodies_inside.append(body)

func _on_body_exited(body: Node2D) -> void:
	if body in bodies_inside:
		bodies_inside.erase(body)

func apply_effects(body: Node2D) -> void:
	var effects_component: StatusEffectsComponent = body.get_node_or_null("StatusEffectsComponent")
	if effects_component:
		for effect in effects:
			effects_component.add_effect(effect.duplicate())
