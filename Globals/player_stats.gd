extends Node

signal score_changed(score)
signal attack_speed_changed

var attack_speed: float = 2.0:
	set(value):
		attack_speed = value
		attack_speed_changed.emit()

var move_speed = 0.3

var bullet_damage: int = 1
var bullet_speed: float = 100.0
var bullet_size: float = 0.2
var enemy_speed: float = 0.1:
	set(value):
		enemy_speed = clampf(value, 0.1, 3.0)

var score: int = 0:
	set(value):
		score = value
		score_changed.emit(score)
		
		if score % 20 == 0:
			bullet_size += 0.02
		
		if score % 15 == 0:
			self.attack_speed += 0.5
		
		if score % 25 == 0:
			enemy_speed += 0.1

func _ready() -> void:
	var main = get_tree().get_first_node_in_group("main")
	main.new_game_set.connect(_on_new_game)

func _on_new_game() -> void:
	attack_speed = 2.0
	move_speed = 0.3

	bullet_damage = 1
	bullet_speed = 100.0
	bullet_size = 0.2
	enemy_speed = 0.1
	score = 0
