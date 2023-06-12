extends Node2D

var pickUp: PackedScene = preload("res://Pickup/pickup.tscn")

@onready var spawn_line: PathFollow2D = $Path2D/SpawnLine

var gameover: bool = false

func game_over() -> void:
	gameover = true

func new_game() -> void:
	gameover = false
	for child in get_children():
		if child is BWPickup:
			remove_child(child)

# ratio between 0 and 1
func spawn_at_ratio(ratio: float) -> void:
	var pickup = pickUp.instantiate()
	spawn_line.progress_ratio = ratio
	pickup.global_position = spawn_line.global_position

	add_child(pickup)

func _on_pickup_timer_timeout() -> void:
	if not gameover:
#		for child in get_children():
#			if child is BWPickup:
#				return
		spawn_at_ratio(randf())
