class_name PlayerHealthComponent extends HealthComponent

func _ready() -> void:
	super._ready()
	call_deferred("_emit_initial_health")

func take_damage(amount: int) -> void:
	health -= amount
	EventBus.player_health_changed.emit(health, max_health)
	if health <= 0:
		die()

func die() -> void:
	EventBus.player_died.emit()
	super.die()

func _process(_delta) -> void:
	if Input.is_action_just_pressed("Debug"):
		take_damage(1)

func _emit_initial_health() -> void:
	EventBus.player_health_changed.emit(health, max_health)
