extends Node2D
class_name DeatheffectComponent

@export var health_component: HealthComponent


func _ready() -> void:
	health_component.health_depleted.connect(_on_health_depleted)

func _on_health_depleted() -> void:
	owner.queue_free()
