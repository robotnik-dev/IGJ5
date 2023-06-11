extends HBoxContainer

@export var health_component: HealthComponent

var full_heart = preload("res://Assets/Heart-full.png")
var empty_heart = preload("res://Assets/Heart-empty.png")

func _ready() -> void:
	health_component.health_changed.connect(set_lifes)

func set_lifes(amount: int) -> void:
	print(amount)
	var i = 0
	for texture in get_children():
		if i == amount:
			break
		texture = texture as TextureRect
		texture.texture = empty_heart
