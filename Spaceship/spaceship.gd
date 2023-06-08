extends CharacterBody2D
class_name Spaceship

@export var speed = 500.0
@export var decceleration = 15
@export var acceleration = 40
@export var attack_speed = 1

var attack_timer

func _ready() -> void:
	attack_timer = Timer.new()
	attack_timer.wait_time = 1
	attack_timer.one_shot = false
	attack_timer.timeout.connect(shoot)
	attack_timer.start()

func _physics_process(delta: float) -> void:
	var direction: Vector2 = get_input_direction()
	
	if direction:
		velocity = velocity.move_toward(direction * speed, acceleration)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, decceleration)
	
	move_and_slide()

func get_input_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized()

func shoot() -> void:
	print("F")

