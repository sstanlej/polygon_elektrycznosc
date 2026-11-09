class_name EnemyMovementController extends Node

@export var movement_speed: float = 50.0
@onready var body: CharacterBody2D = get_parent()
@onready var navigation_agent: NavigationAgent2D = body.get_node_or_null("NavigationAgent2D")

var player: Player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

	if navigation_agent:
		navigation_agent.path_desired_distance = 4.0
		navigation_agent.target_desired_distance = 4.0
		await get_tree().physics_frame
		update_target_position()

func update_target_position() -> void:
	if player and navigation_agent:
		navigation_agent.target_position = player.global_position

func _physics_process(delta: float) -> void:
	if not player or not body or not navigation_agent:
		return

	navigation_agent.target_position = player.global_position

	if navigation_agent.is_navigation_finished():
		body.velocity = body.velocity.move_toward(Vector2.ZERO, movement_speed * 10.0 * delta)
		body.move_and_slide()
		return

	var current_agent_position: Vector2 = body.global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	var direction = (next_path_position - current_agent_position).normalized()
	var target_velocity = direction * movement_speed

	body.velocity = body.velocity.lerp(target_velocity, 15.0 * delta)
	body.move_and_slide()
