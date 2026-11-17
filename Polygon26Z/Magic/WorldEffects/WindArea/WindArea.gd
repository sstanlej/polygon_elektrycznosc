class_name WindArea extends StatusEffectArea

@export var launch_force: float = 1000
var is_triggered: bool = false

func _physics_process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is not Creature or is_triggered:
		return
	print("someone entered wind area")
	bodies_inside.append(body)
	apply_effects(body)
	is_triggered = true
	var movement_controller = body.get_node_or_null("MovementController") as BaseMovementController
	if movement_controller:
		var dir: Vector2 = [Vector2.UP, Vector2.DOWN, Vector2.RIGHT, Vector2.LEFT].pick_random()
		movement_controller.apply_impulse(dir * launch_force)
		var world_effect: WorldEffect  = get_parent()
		world_effect._on_timer_timeout()


func _on_body_exited(body: Node2D) -> void:
	if body in bodies_inside:
		bodies_inside.erase(body)