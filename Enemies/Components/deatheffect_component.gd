extends Node2D
class_name DeatheffectComponent

@export var health_component: HealthComponent

func _ready() -> void:
	health_component.health_depleted.connect(_on_health_depleted)

func _on_health_depleted() -> void:
	if owner is Spaceship:
		get_tree().get_first_node_in_group("main").game_over()
		owner.queue_free()
	else:
		PlayerStats.score += 1
		owner.queue_free()
