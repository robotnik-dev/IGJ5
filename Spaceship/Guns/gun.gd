extends Node2D
class_name Gun

@export var bullet_alignment: AlignmentComponent.Alignment = AlignmentComponent.Alignment.WHITE

var bullet_scene = preload("res://Spaceship/Guns/Bullets/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.init(
		global_position,
		global_rotation,
		bullet_alignment,
		PlayerStats.bullet_damage,
		PlayerStats.bullet_speed,
		PlayerStats.bullet_size
	)
	
	add_child(bullet)
