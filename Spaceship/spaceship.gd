extends CharacterBody2D
class_name Spaceship

@export var guns: Node2D

@export var stats: SpaceshipStats

var attack_timer

func _ready() -> void:
	attack_timer = Timer.new()
	attack_timer.wait_time = 1.0 / stats.attack_speed
	attack_timer.one_shot = false
	attack_timer.autostart = true
	add_child(attack_timer)
	attack_timer.timeout.connect(shoot)
	attack_timer.start()

func _physics_process(delta: float) -> void:
	var direction: Vector2 = get_input_direction()
	
	if direction:
		velocity = velocity.move_toward(direction * stats.speed, stats.acceleration)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, stats.decceleration)
	
	move_and_slide()

func get_input_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized()

func shoot() -> void:
	if guns.has_method("shoot"):
		guns.shoot()

