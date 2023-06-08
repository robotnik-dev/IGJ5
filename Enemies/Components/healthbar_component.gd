extends ProgressBar
class_name HealthbarComponent

@export var health_component: HealthComponent

func _ready() -> void:
	step = 1
	max_value = health_component.max_health

func _process(delta: float) -> void:
	value = health_component.health
