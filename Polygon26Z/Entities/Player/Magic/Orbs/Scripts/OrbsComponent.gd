class_name OrbsComponent extends Node2D

@export var slots_container: VBoxContainer
@export var orb_slot: PackedScene
@export var slots_amount: int = 3
@export var available_orbs: Array[OrbData]

var orbs_queue: Array[PackedScene]
var slots: Array[OrbSlot]

func _ready() -> void:
	EventBus.spell1_clicked.connect(on_spell1_clicked)
	draw_slots(slots_amount)
	build_orbs_queue(slots_amount)

func _process(_delta: float) -> void:
	pass

func build_orbs_queue(amount: int) -> void:
	orbs_queue.clear()
	for i in amount:
		var selected_orb = available_orbs.pick_random()
		slots[i].set_orb(selected_orb)
		print("Orb ", i, " set to ", selected_orb.name)

func draw_slots(amount: int) -> void:
	if slots_container and orb_slot:
		for slot in slots_container.get_children():
			slot.queue_free()
		for i in amount:
			var slot_instance = orb_slot.instantiate() as OrbSlot
			slots_container.add_child(slot_instance)
			slots.append(slot_instance)

func on_spell1_clicked(position: Vector2) -> void:
	print("Spell1 at ", position)
