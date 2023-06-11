extends Label

func _ready() -> void:
	PlayerStats.score_changed.connect(_score_changed)


func _score_changed(value: int) -> void:
	text = str(value)
