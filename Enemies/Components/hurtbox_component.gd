extends Area2D
class_name HurtboxComponent

@export var health_component: HealthComponent
@export var alignment_component: AlignmentComponent

func take_damage(damage: Damage) -> void:
	if owner is Enemy:
		if is_same_alignment(damage.alignment):
			health_component.damage(damage.amount)
	else:
		if not is_same_alignment(damage.alignment):
			health_component.damage(damage.amount)

func is_same_alignment(alignment) -> bool:
	var same = false
	same = AlignmentComponent.Alignment.keys()[alignment] == AlignmentComponent.Alignment.keys()[alignment_component.alignment]
	return same
