extends Node
class_name HealthComponent

signal health_depleted
signal health_changed(health)

@export var max_health: int = 100

var damage_cooldown_timer: Timer

var health: int:
	set(amount):
		health = amount
		health_changed.emit(health)

# cooldown for damage?
func _ready() -> void:
	damage_cooldown_timer = Timer.new()
	damage_cooldown_timer.wait_time = 1.0
	damage_cooldown_timer.one_shot = true
	add_child(damage_cooldown_timer)

	to_full_health()

func damage(amount: int) -> void:
	if owner is Spaceship:
		if damage_cooldown_timer.is_stopped():
			damage_cooldown_timer.start()
			var audio = AudioStreamPlayer.new()
			audio.stream = load("res://Assets/Sounds/hurt2.wav")
			add_child(audio)
			audio.play()
			health -= amount
			if health <= 0:
				health_depleted.emit()
	else:
		health -= amount
		if health <= 0:
			health_depleted.emit()

func to_full_health() -> void:
	self.health = max_health
