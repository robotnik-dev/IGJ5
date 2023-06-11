extends Node2D
class_name Enemy

@export var damage: int = 1

@onready var alignment_component: Node = $AlignmentComponent

var current_map_pos: Vector2i

var alignment: AlignmentComponent.Alignment:
	get:
		return alignment_component.alignment


func _ready() -> void:
	var start_pos = Playfield.local_to_map(global_position)
	global_position = Playfield.map_to_local(start_pos)
	current_map_pos = start_pos
