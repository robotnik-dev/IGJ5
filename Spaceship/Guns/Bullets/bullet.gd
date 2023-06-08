extends Area2D
class_name Bullet

var speed: float = 1000.0
var damage: float = 1.0

func init(pos: Vector2, rot: float) -> void:
	global_position = pos
	global_rotation = rot

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	top_level = true

func _physics_process(delta: float) -> void:
	global_position.y -= speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		var damage_obj = Damage.new(damage, "Dark")
		area.call_deferred("take_damage", damage_obj)
