class_name PlayerMovementController extends BaseMovementController

@onready var animation_player: AnimationPlayer = body.get_node_or_null("AnimationPlayer")
@onready var sprite: Sprite2D = body.get_node_or_null("Sprite2D")

func _physics_process(delta: float) -> void:
	if not body:
		return
		
	var input_direction: Vector2 = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	var move_velocity: Vector2 = input_direction * get_current_speed()
	
	body.velocity = move_velocity + external_velocity
	body.move_and_slide()
	
	super(delta)
	
	if sprite and input_direction.x != 0:
		sprite.flip_h = input_direction.x > 0
		
	if animation_player:
		if input_direction == Vector2.ZERO:
			animation_player.play("Idle")
		else:
			animation_player.play("Walk")
