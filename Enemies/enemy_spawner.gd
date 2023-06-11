extends Node2D

var enemy_scene: PackedScene = preload("res://Enemies/enemy.tscn")

@onready var spawn_line: PathFollow2D = $Path2D/SpawnLine

# ratio between 0 and 1
func spawn_enemy_at_ratio(ratio: float) -> void:
	var enemy = enemy_scene.instantiate()
	spawn_line.progress_ratio = ratio
	
	enemy.global_position = spawn_line.global_position
	
	add_child(enemy)

func move_all_enemies_down() -> void:
	var enemies = get_tree().get_nodes_in_group("Enemy")
	
	for enemy in enemies:
		Playfield.move_enemy_to(enemy.current_map_pos + Vector2i.DOWN, enemy)


func _on_spawn_timer_timeout() -> void:
	spawn_enemy_at_ratio(randf())


func _on_move_timer_timeout() -> void:
	move_all_enemies_down()
