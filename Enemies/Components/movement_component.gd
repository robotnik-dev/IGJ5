extends Node
class_name MovementComponent

@export var move_speed: float = 1.0

var move_speed_scale: float = 5.0

var move_timer: Timer
var current_map_pos: Vector2i

func _ready() -> void:
	move_timer = Timer.new()
	move_timer.wait_time = (move_speed_scale - move_speed) / move_speed_scale
	move_timer.one_shot = false
	add_child(move_timer)
	move_timer.start()
	
	
	var start_pos = Playfield.local_to_map(owner.global_position)
	owner.global_position = Playfield.map_to_local(start_pos)
	current_map_pos = start_pos
