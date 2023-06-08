extends Node
class_name HealthComponent

signal health_depleted

@export var max_health: int = 100

var health: int

func _ready() -> void:
	to_full_health()

func damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		health_depleted.emit()

func to_full_health() -> void:
	health = max_health
