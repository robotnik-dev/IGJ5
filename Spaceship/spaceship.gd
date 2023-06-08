extends Node2D
class_name Spaceship

@export var guns: Node2D
@export var sprite_component: SpriteComponent

var attack_timer: Timer
var move_timer: Timer
var current_map_pos: Vector2i

var move_speed_scale: float = 5.0

func _ready() -> void:
	_set_attack_timer()
	_set_move_timer()

func _set_attack_timer() -> void:
	attack_timer = Timer.new()
	attack_timer.wait_time = 1.0 / PlayerStats.attack_speed
	attack_timer.one_shot = false
	add_child(attack_timer)
	attack_timer.timeout.connect(shoot)
	attack_timer.start()

func _set_move_timer() -> void:
	move_timer = Timer.new()
	move_timer.wait_time = (1.1 - PlayerStats.move_speed) / move_speed_scale
	move_timer.one_shot = true
	add_child(move_timer)
	move_timer.start()

	var start_pos = Playfield.local_to_map(global_position)
	global_position = Playfield.map_to_local(start_pos)
	current_map_pos = start_pos

func _physics_process(delta: float) -> void:
	var direction: Vector2i = get_input_direction()
	
	if direction:
		if move_timer.time_left == 0:
			move_timer.start()
			move_to(current_map_pos + direction)

func move_to(map_pos: Vector2i) -> void:
	var next_pos: Vector2i = map_pos
	if next_pos.x >= Playfield.oob_right or next_pos.x <= Playfield.oob_left:
		next_pos.x = current_map_pos.x
	
	if next_pos.y >= Playfield.oob_bottom or next_pos.y <= Playfield.oob_top:
		next_pos.y = current_map_pos.y
	
	global_position = Playfield.map_to_local(next_pos)
	current_map_pos = Playfield.local_to_map(global_position)

func change_alignment(alignment: AlignmentComponent.Alignment) -> void:
	sprite_component.change_alignment(alignment)

func get_input_direction() -> Vector2i:
	return Vector2i(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)

func shoot() -> void:
	if guns.has_method("shoot"):
		guns.shoot()

