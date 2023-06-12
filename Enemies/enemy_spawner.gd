extends Node2D

var enemy_scene: PackedScene = preload("res://Enemies/enemy.tscn")

@onready var spawn_line: PathFollow2D = $Path2D/SpawnLine
@onready var spawn_timer: Timer = $SpawnTimer
@onready var move_timer: Timer = $MoveTimer

func _ready() -> void:
	PlayerStats.score_changed.connect(_score_changed)

func _score_changed(score: int) -> void:
	move_timer.wait_time = (1.1 - PlayerStats.enemy_speed)

func new_game() -> void:
	for child in get_children():
		if child is Enemy:
			child.queue_free()
	
	spawn_timer.start()
	move_timer.start()

# ratio between 0 and 1
func spawn_enemy_at_ratio(ratio: float) -> void:
	var enemy = enemy_scene.instantiate() as Enemy
	spawn_line.progress_ratio = ratio
	enemy.global_position = spawn_line.global_position
	enemy.alignment = Playfield.global_alignment
	add_child(enemy)

func move_all_enemies_down() -> void:
	var enemies = get_tree().get_nodes_in_group("Enemy")
	
	for enemy in enemies:
		Playfield.move_enemy_to(enemy.current_map_pos + Vector2i.DOWN, enemy)

func _on_spawn_timer_timeout() -> void:
	for i in range(randi_range(1, 2)):
		spawn_enemy_at_ratio(randf())

func _on_move_timer_timeout() -> void:
	move_all_enemies_down()

func _on_despawn_area_area_exited(area: Area2D) -> void:
	area.owner.queue_free()
