class_name EnemyMovementController extends BaseMovementController

@export var waypoint_desired_distance: float = 40.0
@export var target_desired_distance: float = 40.0
@export var path_update_interval: float = 0.4

var player: Player
var grid_manager: GridManager

var internal_velocity: Vector2 = Vector2.ZERO
var current_path: PackedVector2Array = PackedVector2Array()
var current_path_index: int = 0
var path_update_timer: float = 0.0
var last_player_grid_cell: Vector2i = Vector2i(-999999, -999999)

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	grid_manager = get_tree().get_first_node_in_group("GridManager")

	if grid_manager:
		grid_manager.pathfinding_changed.connect(on_pathfinding_changed)

	path_update_timer = randf_range(0.0, path_update_interval)
	await get_tree().physics_frame
	recalculate_path()

func on_pathfinding_changed() -> void:
	recalculate_path()

func recalculate_path() -> void:
	if not player:
		player = get_tree().get_first_node_in_group("Player")
	if not grid_manager:
		grid_manager = get_tree().get_first_node_in_group("GridManager")
		if grid_manager and not grid_manager.pathfinding_changed.is_connected(on_pathfinding_changed):
			grid_manager.pathfinding_changed.connect(on_pathfinding_changed)

	if not player or not body or not grid_manager:
		return

	last_player_grid_cell = grid_manager.world_to_grid(player.global_position)
	var new_path: PackedVector2Array = grid_manager.get_path_world(body.global_position, player.global_position)
	if new_path.is_empty():
		current_path.clear()
		current_path_index = 0
		return

	current_path = new_path
	current_path_index = 0
	advance_to_next_active_waypoint()

func advance_to_next_active_waypoint() -> void:
	while current_path_index < current_path.size() - 1:
		var waypoint: Vector2 = current_path[current_path_index]
		var next_waypoint: Vector2 = current_path[current_path_index + 1]

		if body.global_position.distance_to(waypoint) <= waypoint_desired_distance:
			current_path_index += 1
			continue

		var to_wp: Vector2 = waypoint - body.global_position
		var segment: Vector2 = next_waypoint - waypoint
		if to_wp.dot(segment) < 0.0:
			current_path_index += 1
			continue

		break

func _physics_process(delta: float) -> void:
	if not player:
		player = get_tree().get_first_node_in_group("Player")
	if not body:
		return

	path_update_timer += delta
	var should_update: bool = false
	if path_update_timer >= path_update_interval:
		path_update_timer = 0.0
		should_update = true
	elif grid_manager:
		var current_player_cell: Vector2i = grid_manager.world_to_grid(player.global_position)
		if current_player_cell != last_player_grid_cell:
			should_update = true

	if should_update or current_path.is_empty():
		recalculate_path()

	var movement_speed: float = get_current_speed()
	var dist_to_player: float = body.global_position.distance_to(player.global_position) if player else INF

	if dist_to_player <= target_desired_distance:
		internal_velocity = internal_velocity.move_toward(Vector2.ZERO, movement_speed * 10.0 * delta)
	else:
		advance_to_next_active_waypoint()

		if current_path_index < current_path.size():
			var target_position: Vector2 = current_path[current_path_index]

			if current_path_index == current_path.size() - 1:
				target_position = player.global_position

			var direction: Vector2 = (target_position - body.global_position).normalized()
			var target_velocity: Vector2 = direction * movement_speed
			internal_velocity = internal_velocity.lerp(target_velocity, 15.0 * delta)
		else:
			internal_velocity = internal_velocity.move_toward(Vector2.ZERO, movement_speed * 10.0 * delta)

	body.velocity = internal_velocity + external_velocity
	body.move_and_slide()

	super(delta)
