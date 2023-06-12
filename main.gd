extends Node

var spaceShip = preload("res://Spaceship/spaceship.tscn")

@onready var gameover: Control = $UI/Gameover
@onready var enemy_manager: Node2D = $EnemyManager
@onready var spaceship_spawn: Marker2D = $SpaceshipSpawn
@onready var pickup_spawner: Node2D = $PickupSpawner
@onready var hud: Control = $UI/HUD
@onready var help: Control = $UI/Help

var spaceship: Spaceship

func _ready() -> void:
	new_game()

func game_over() -> void:
	pickup_spawner.game_over()
	gameover.show()

func new_game() -> void:
	PlayerStats.score = 0
	gameover.hide()
	enemy_manager.new_game()
	pickup_spawner.new_game()
	hud.show()
	
	spaceship = spaceShip.instantiate() as Spaceship
	spaceship.global_position = spaceship_spawn.global_position
	add_child(spaceship)


func _on_new_game_pressed() -> void:
	new_game()
