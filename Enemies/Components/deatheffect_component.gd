extends Node2D
class_name DeatheffectComponent

var death_audio = preload("res://Assets/Sounds/select3.wav")

@export var health_component: HealthComponent

func _ready() -> void:
	health_component.health_depleted.connect(_on_health_depleted)

func _on_health_depleted() -> void:
	if owner is Spaceship:
		get_tree().get_first_node_in_group("main").game_over()
		owner.queue_free()
	else:
		PlayerStats.score += 1
		var audio = AudioStreamPlayer.new()
		audio.volume_db = -24
		audio.stream = death_audio
		get_tree().get_first_node_in_group("main").add_child(audio)
		audio.finished.connect(audio.queue_free)
		audio.play()
		owner.queue_free()
