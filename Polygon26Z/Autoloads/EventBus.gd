extends Node

signal player_health_changed(current: int, max: int)
signal player_died()
signal spell1_clicked(grid_coords: Vector2i)
signal spell2_clicked(grid_coords: Vector2i)
signal world_effect_casted(effect_scene: PackedScene, grid_coords: Vector2i)
signal world_effect_expired(effect_instance: WorldEffect, grid_coords: Vector2i)
