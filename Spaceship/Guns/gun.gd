extends Node2D

@export var bullet_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.init(global_position, global_rotation)
	add_child(bullet)
