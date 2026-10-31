class_name Enemy_test extends Creature

@export var health_bar: ProgressBar
@export var health_component: HealthComponent

func _ready() -> void:
	if health_component:
		health_component.health_initialized.connect(on_health_initialized)
		health_component.health_changed.connect(on_health_changed)

func on_health_initialized(max_health: int) -> void:
	health_bar.max_value = max_health
	health_bar.value = max_health
	print("health initialized")

func on_health_changed(current_health: int, max_health: int) -> void:
	health_bar.max_value = max_health
	health_bar.value = current_health
	print("health changed")
