extends Node
class_name AlignmentComponent

enum Alignment {
	WHITE,
	BLACK
}

@export var sprite_component: SpriteComponent
@export var alignment: Alignment:
	set(value):
		alignment = value
		if sprite_component:
			sprite_component.change_alignment(alignment)

func _ready() -> void:
	self.alignment = alignment
