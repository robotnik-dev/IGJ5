extends Resource
class_name Damage

var amount: float
var type: StringName

func _init(_amount: float, _type: StringName) -> void:
	amount = _amount
	type = _type
