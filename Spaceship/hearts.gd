extends HBoxContainer

@export var health_component: HealthComponent

var full_heart = preload("res://Assets/Heart-full.png")
var empty_heart = preload("res://Assets/Heart-empty.png")

func _ready() -> void:
	health_component.health_changed.connect(set_lifes)

func set_lifes(amount: int) -> void:
	match amount:
		0:
			for child in get_children():
				child.texture = empty_heart
		1:
			get_child(0).texture = empty_heart
			get_child(1).texture = empty_heart
		2:
			get_child(0).texture = empty_heart
		3:
			for child in get_children():
				child.texture = full_heart
		_:
			pass
