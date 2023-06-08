extends Resource
class_name Damage

enum Alignment {
	WHITE,
	DARK
}

var amount: float
var alignment: int

func _init(_amount: float, _alignment: int) -> void:
	amount = _amount
	alignment = _alignment
