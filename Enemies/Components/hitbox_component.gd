extends Area2D
class_name HitboxComponent

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		var damage_obj = Damage.new(owner.damage, owner.alignment)
		area.call_deferred("take_damage", damage_obj)
