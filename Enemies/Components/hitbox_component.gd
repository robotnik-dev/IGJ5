extends Area2D
class_name HitboxComponent

@export var health_component: HealthComponent
@export var alignment_component: AlignmentComponent

func take_damage(damage: Damage) -> void:
	if is_same_alignment(damage.alignment):
		health_component.damage(damage.amount)

func is_same_alignment(alignment) -> bool:
	var same = false
	same = AlignmentComponent.Alignment.keys()[alignment] == AlignmentComponent.Alignment.keys()[alignment_component.alignment]
	return same
