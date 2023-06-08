extends Node2D
class_name Enemy

@onready var alignment_component: Node = $AlignmentComponent

var current_map_pos: Vector2i
var alignment: AlignmentComponent.Alignment:
	get:
		return alignment_component.alignment
var damage: int = 1

func move_to(map_pos: Vector2i) -> void:
	global_position = Playfield.map_to_local(map_pos)
	current_map_pos = Playfield.local_to_map(global_position)
	
