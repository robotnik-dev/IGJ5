extends Node2D
class_name Enemy

@export var damage: int = 1

@onready var alignment_component: AlignmentComponent = $AlignmentComponent

var current_map_pos: Vector2i

var alignment: AlignmentComponent.Alignment:
	set(value):
		alignment = value
		if alignment_component:
			alignment_component.alignment = alignment

func change_alignment() -> void:
	match alignment:
		AlignmentComponent.Alignment.WHITE:
			alignment = AlignmentComponent.Alignment.BLACK
		AlignmentComponent.Alignment.BLACK:
			alignment = AlignmentComponent.Alignment.WHITE

func _ready() -> void:
	var start_pos = Playfield.local_to_map(global_position)
	global_position = Playfield.map_to_local(start_pos)
	current_map_pos = start_pos
	
	self.alignment = alignment
