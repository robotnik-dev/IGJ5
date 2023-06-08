extends Node2D
class_name Enemy

var current_map_pos: Vector2i

func move_to(map_pos: Vector2i) -> void:
	global_position = Tilemap.map_to_local(map_pos)
	current_map_pos = Tilemap.local_to_map(global_position)
	
