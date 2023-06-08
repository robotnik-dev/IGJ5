extends Node2D

@export var slots: int = 2


func shoot() -> void:
	for child in get_children():
		if child.has_method("shoot"):
			child.shoot()
