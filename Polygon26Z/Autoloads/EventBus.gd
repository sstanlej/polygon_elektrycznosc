extends Node

signal player_health_changed(current: int, max: int)
signal player_died()
signal spell1_clicked(position: Vector2, area: Area2D)
signal spell2_clicked(position: Vector2, area: Area2D)
signal world_effect_expired(grid_coords: Vector2i)
