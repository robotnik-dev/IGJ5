extends Control

var can_toggle = false

func _unhandled_input(event: InputEvent) -> void:
	if can_toggle:
		if event.is_action_pressed("ui_cancel"):
			get_tree().paused = !get_tree().paused
			visible = !visible
