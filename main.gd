extends Node

var spaceShip = preload("res://Spaceship/spaceship.tscn")

@onready var gameover: Control = $UI/Gameover
@onready var enemy_manager: Node2D = $EnemyManager
@onready var spaceship_spawn: Marker2D = $SpaceshipSpawn

var spaceship: Spaceship

func _ready() -> void:
	new_game()

func game_over() -> void:
	gameover.show()

func new_game() -> void:
	if spaceship:
		remove_child(spaceship)
	PlayerStats.score = 0
	gameover.hide()
	enemy_manager.new_game()
	spaceship = spaceShip.instantiate() as Spaceship
	spaceship.global_position = spaceship_spawn.global_position
	add_child(spaceship)
#	spaceship.alignment = AlignmentComponent.Alignment.BLACK

func _on_new_game_pressed() -> void:
	new_game()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		spaceship.change_bullet_alignment()
