class_name EffectData extends Resource

@export var id: String = "default"
@export var duration: float = 5.0
@export var has_tint: bool = false
@export var tint_color: Color = Color.WHITE
@export var tags: Array[String] = []
@export var removes_tags: Array[String] = []
@export var behaviors: Array[EffectBehavior] = []

func create_instance() -> ActiveEffect:
	return ActiveEffect.new(self)