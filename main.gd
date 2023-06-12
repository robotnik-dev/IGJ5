extends Node

signal new_game_set

var spaceShip = preload("res://Spaceship/spaceship.tscn")

@onready var gameover: Control = $UI/Gameover
@onready var enemy_manager: Node2D = $EnemyManager
@onready var spaceship_spawn: Marker2D = $SpaceshipSpawn
@onready var pickup_spawner: Node2D = $PickupSpawner
@onready var hud: Control = $UI/HUD
@onready var help: Control = $UI/Help
@onready var title_screen: Control = $UI/TitleScreen
@onready var animation_player: AnimationPlayer = $UI/HUD/HBoxContainer/AnimationPlayer
@onready var start: Button = $UI/TitleScreen/MarginContainer/VBoxContainer/Start
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var spaceship: Spaceship

func _ready() -> void:
	start.grab_focus()

func game_over() -> void:
	pickup_spawner.game_over()
	gameover.show()
	animation_player.stop()

func new_game() -> void:
	PlayerStats.score = 0
	gameover.hide()
	enemy_manager.new_game()
	pickup_spawner.new_game()
	hud.show()
	title_screen.hide()
	
	spaceship = spaceShip.instantiate() as Spaceship
	spaceship.global_position = spaceship_spawn.global_position
	add_child(spaceship)
	
	help.can_toggle = true
	
	animation_player.play("switch_color")

func switch_color() -> void:
	spaceship.change_ship_alignment()

func _on_new_game_pressed() -> void:
	new_game()

func _on_start_pressed() -> void:
	audio_stream_player.play()
	new_game()
