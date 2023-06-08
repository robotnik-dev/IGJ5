extends Sprite2D
class_name SpriteComponent

func change_alignment(alignment: AlignmentComponent.Alignment) -> void:
	match alignment:
		AlignmentComponent.Alignment.WHITE:
			modulate = Color(1, 1, 1)
		AlignmentComponent.Alignment.BLACK:
			modulate = Color(0, 0, 0)
