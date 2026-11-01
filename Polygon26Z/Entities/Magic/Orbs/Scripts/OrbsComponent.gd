class_name OrbsComponent extends Node2D

@export var slots_container: VBoxContainer
@export var orb_slot: PackedScene
@export var slots_amount: int = 3
@export var available_orbs: Array[OrbData]
@export var orb_generation_cooldown: float = 3
@export var orb_generation_timer: Timer
@export var orb_generation_bar: ProgressBar
@export var orb_cast_cooldown: float = 3
@export var orb_cast_timer: Timer

var slots: Array[OrbSlot]
var orbs_queue: Array[OrbData]
var can_cast: bool = true

var grid_manager: GridManager
var mouse_controller: MouseController

func _ready() -> void:
	build_slots(slots_amount)
	add_random_orbs(slots_amount+1)
	orb_generation_bar.max_value = orb_generation_cooldown
	orb_generation_timer.wait_time = orb_generation_cooldown
	if orbs_queue.size() <= slots_amount:
		orb_generation_timer.start()
	orb_cast_timer.wait_time = orb_generation_cooldown # Not orb_cast_cooldown
	EventBus.spell1_clicked.connect(on_spell1_clicked)
	EventBus.spell2_clicked.connect(on_spell2_clicked)
	mouse_controller = get_tree().get_first_node_in_group("MouseController")
	#mouse_controller.set_current_orb_sprite(get_current_orb().texture)
	grid_manager = get_tree().get_first_node_in_group("GridManager")

func _process(_delta: float) -> void:
	orb_generation_bar.value = orb_generation_timer.time_left

func add_random_orbs(amount: int) -> void:
	for i in amount:
		var selected_orb = available_orbs.pick_random()
		orbs_queue.append(selected_orb)
	set_slots()

func pop_current_orb() -> OrbData:
	var current_orb: OrbData = orbs_queue.pop_front()
	set_slots()
	return current_orb

func get_current_orb() -> OrbData:
	return orbs_queue[0]

func build_slots(amount: int) -> void:
	if slots_container and orb_slot:
		for child in slots_container.get_children():
			if child is OrbSlot:
				child.queue_free()
		for i in amount:
			var slot_instance = orb_slot.instantiate() as OrbSlot
			slots_container.add_child(slot_instance)
			slots.append(slot_instance)
			if i == amount - 1:
				slot_instance.self_modulate.g = 0.1
				slot_instance.self_modulate.b = 0

func set_slots() -> void:
	for slot in slots:
		slot.remove_orb()
	for i in orbs_queue.size():
		var slot_index: int = slots.size() - 1 - i
		if slot_index < 0:
			return
		slots[slot_index].set_orb(orbs_queue[i])

func get_orbs_count() -> int:
	var count: int = 0
	for i in slots.size():
		if slots[i].get_orb():
			count += 1
	return count

func on_spell1_clicked(grid_coords: Vector2i) -> void:
	var current_orb: OrbData = get_current_orb()
	if not check_cast_conditions(current_orb, grid_coords):
		return
		
	pop_current_orb()
	can_cast = false
	orb_cast_timer.start()
	var effect_scene: PackedScene = current_orb.effect1_scene
	if not effect_scene:
		return
	EventBus.world_effect_casted.emit(effect_scene, grid_coords)
	if orb_generation_timer.is_stopped():
		orb_generation_timer.start()
	#mouse_controller.set_current_orb_sprite(get_current_orb().texture)

func check_cast_conditions(current_orb: OrbData, grid_coords: Vector2i) -> bool:
	if not can_cast:
		print("can't cast, on cooldown!")
		return false
	if not current_orb:
		return false
	var tile_effect = grid_manager.get_tile_effect(grid_coords)
	if tile_effect:
		grid_manager.check_effects_mix(current_orb.effect1_scene, grid_coords)
		return false
	if grid_manager.get_wall(grid_coords):
		print("There is a wall here!")
		return false
	return true

func on_spell2_clicked(_grid_coords: Vector2i) -> void:
	pass

func _on_orb_generation_timer_timeout() -> void:
	if orbs_queue.size() <= slots_amount:
		add_random_orbs(1)
	if orbs_queue.size() > slots_amount:
		orb_generation_timer.stop()

func _on_orb_cast_timer_timeout() -> void:
	can_cast = true
