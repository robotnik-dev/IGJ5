extends Node
class_name HealthComponent

signal health_depleted
signal health_changed(health)

@export var max_health: int = 100

# cooldown for damage?

var health: int:
	set(amount):
		health = amount
		health_changed.emit(health)

func _ready() -> void:
	to_full_health()

func damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		health_depleted.emit()

func to_full_health() -> void:
	health = max_health
