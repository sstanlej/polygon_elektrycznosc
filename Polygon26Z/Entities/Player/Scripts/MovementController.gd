class_name MovementController extends Node

@onready var body: CharacterBody2D = get_parent()
@onready var animation_player: AnimationPlayer = body.get_node_or_null("AnimationPlayer")
@onready var sprite: Sprite2D = body.get_node_or_null("Sprite2D")
@onready var effects_component: StatusEffectsComponent = body.get_node_or_null("StatusEffectsComponent")

@export var base_movement_speed: float = 600.0

func _physics_process(_delta: float) -> void:
	if not body:
		return
		
	var input_direction: Vector2 = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	var movement_speed: float = base_movement_speed
	
	if effects_component:
		movement_speed *= effects_component.get_stat_multiplier(StatusEffectsComponent.StatType.MOVEMENT_SPEED)
		
	body.velocity = input_direction * movement_speed
	body.move_and_slide()
	
	if sprite and input_direction.x != 0:
		sprite.flip_h = input_direction.x > 0
		
	if animation_player:
		if input_direction == Vector2.ZERO:
			animation_player.play("Idle")
		else:
			animation_player.play("Walk")
