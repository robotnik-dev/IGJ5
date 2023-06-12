extends Node2D
class_name Spaceship

@export var guns: Node2D
@export var sprite_component: SpriteComponent
@export var alignment_component: AlignmentComponent
@onready var gun: Gun = $Guns/Gun
@onready var gun_2: Gun = $Guns/Gun2

var alignment: AlignmentComponent.Alignment:
	set(value):
		alignment = value
		alignment_component.alignment = alignment

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
			Playfield.move_spaceship_to(current_map_pos + direction, self)

func get_input_direction() -> Vector2i:
	return Vector2i(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)

func change_ship_alignment() -> void:
	match alignment:
		AlignmentComponent.Alignment.WHITE:
			alignment = AlignmentComponent.Alignment.BLACK
		AlignmentComponent.Alignment.BLACK:
			alignment = AlignmentComponent.Alignment.WHITE 

func change_bullet_alignment() -> void:
	for child in guns.get_children():
		match child.bullet_alignment:
			AlignmentComponent.Alignment.WHITE:
				child.bullet_alignment = AlignmentComponent.Alignment.BLACK
			AlignmentComponent.Alignment.BLACK:
				child.bullet_alignment = AlignmentComponent.Alignment.WHITE

func shoot() -> void:
	if guns.has_method("shoot"):
		guns.shoot()

