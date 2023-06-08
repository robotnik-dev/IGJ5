extends Node2D
class_name Bullet

var alignment: AlignmentComponent.Alignment:
	set(value):
		alignment = value
		if sprite_component:
			sprite_component.change_alignment(alignment)

var damage: int
var speed: float
var size: float:
	set(value):
		size = value
		scale.x = size
		scale.y = size

@onready var sprite_component: Sprite2D = $SpriteComponent

func init(
		pos: Vector2,
		rot: float,
		_alignment,
		_damage,
		_speed,
		_size
	) -> void:
	
	global_position = pos
	global_rotation = rot
	alignment = _alignment
	damage = _damage
	speed = _speed
	size = _size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	top_level = true

func _physics_process(delta: float) -> void:
	global_position.y -= speed * delta
