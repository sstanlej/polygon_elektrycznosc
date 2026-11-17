class_name EnemyMovementController extends BaseMovementController

@onready var navigation_agent: NavigationAgent2D = body.get_node_or_null("NavigationAgent2D")

var player: Player
var internal_velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

	if navigation_agent:
		navigation_agent.path_desired_distance = 24.0
		navigation_agent.target_desired_distance = 24.0
		await get_tree().physics_frame
		update_target_position()

func update_target_position() -> void:
	if player and navigation_agent:
		navigation_agent.target_position = player.global_position

func _physics_process(delta: float) -> void:
	if not player or not body or not navigation_agent:
		return

	navigation_agent.target_position = player.global_position
	var movement_speed: float = get_current_speed()

	if navigation_agent.is_navigation_finished():
		internal_velocity = internal_velocity.move_toward(Vector2.ZERO, movement_speed * 10.0 * delta)
	else:
		var current_agent_position: Vector2 = body.global_position
		var next_path_position: Vector2 = navigation_agent.get_next_path_position()
		var direction: Vector2 = (next_path_position - current_agent_position).normalized()
		var target_velocity: Vector2 = direction * movement_speed
		internal_velocity = internal_velocity.lerp(target_velocity, 15.0 * delta)

	body.velocity = internal_velocity + external_velocity
	body.move_and_slide()
	
	super(delta)
