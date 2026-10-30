class_name OrbsComponent extends Node2D

@export var slots_container: VBoxContainer
@export var orb_slot: PackedScene
@export var slots_amount: int = 3
@export var available_orbs: Array[OrbData]
@export var orb_generation_cooldown: float = 3
@export var orb_generation_timer: Timer

var slots: Array[OrbSlot]
var orbs_queue: Array[OrbData]

var effects_container: Node

func _ready() -> void:
	orb_generation_timer.wait_time = orb_generation_cooldown
	orb_generation_timer.start()
	EventBus.spell1_clicked.connect(on_spell1_clicked)
	EventBus.spell2_clicked.connect(on_spell2_clicked)
	effects_container = get_tree().get_first_node_in_group("EffectsContainer")
	build_slots(slots_amount)
	#add_random_orbs(slots_amount)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Debug"):
		add_random_orbs(1)

func add_random_orbs(amount: int) -> void:
	for i in amount:
		var selected_orb = available_orbs.pick_random()
		orbs_queue.append(selected_orb)
	set_slots()

func pop_current_orb() -> OrbData:
	var current_orb: OrbData = orbs_queue.pop_front()
	set_slots()
	return current_orb

func build_slots(amount: int) -> void:
	if slots_container and orb_slot:
		for slot in slots_container.get_children():
			slot.queue_free()
		for i in amount:
			var slot_instance = orb_slot.instantiate() as OrbSlot
			slots_container.add_child(slot_instance)
			slots.append(slot_instance)

func set_slots() -> void:
	for i in slots.size():
		slots[i].remove_orb()
	for i in slots.size():
		if i >= orbs_queue.size():
			return
		slots[i].set_orb(orbs_queue[i])

func get_orbs_count() -> int:
	var count: int = 0
	for i in slots.size():
		if slots[i].get_orb():
			count += 1
	return count

func on_spell1_clicked(position: Vector2) -> void:
	var current_orb = pop_current_orb()
	if not current_orb:
		return
	var effect_scene: PackedScene = current_orb.effect1_scene
	if not effect_scene:
		return
	var effect_instance = effect_scene.instantiate() as Node2D
	effect_instance.global_position = position
	effects_container.add_child(effect_instance)
	print(current_orb.name, " spell1 at ", position)

func on_spell2_clicked(position: Vector2) -> void:
	print("Spell2 at ", position)

func _on_orb_generation_timer_timeout() -> void:
	if orbs_queue.size() < slots_amount:
		add_random_orbs(1)
