class_name OrbSlot extends TextureRect

@export var orb_texture: TextureRect
var orb_data: OrbData

func set_orb(new_orb_data: OrbData) -> void:
	orb_data = new_orb_data
	orb_texture.texture = new_orb_data.texture

func get_orb() -> OrbData:
	return orb_data
	
func remove_orb() -> void:
	orb_data = null
	orb_texture.texture = null
