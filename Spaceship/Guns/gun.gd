extends Node2D
class_name Gun

@export var bullet_alignment: AlignmentComponent.Alignment = AlignmentComponent.Alignment.WHITE
@export var bullet_damage: int = 1
@export var bullet_speed: float = 500.0
@export var bullet_size: float = 0.2

var bullet_scene = preload("res://Spaceship/Guns/Bullets/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.init(
		global_position,
		global_rotation,
		bullet_alignment,
		bullet_damage,
		bullet_speed,
		bullet_size
	)
	
	add_child(bullet)
