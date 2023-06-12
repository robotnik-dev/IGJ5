extends Area2D
class_name BWPickup

var death_audio = preload("res://Assets/Sounds/pickup1.wav")

func _ready() -> void:
	var start_pos = Playfield.local_to_map(global_position)
	global_position = Playfield.map_to_local(start_pos)

func _on_area_entered(area: Area2D) -> void:
	if area.owner is Spaceship:
		area.owner.change_bullet_alignment()
		PlayerStats.score += 5
	elif area.owner is Enemy:
		Playfield.change_global_alignment()
	
	var audio = AudioStreamPlayer.new()
	audio.volume_db = -12
	audio.stream = death_audio
	get_tree().get_first_node_in_group("main").add_child(audio)
	audio.finished.connect(audio.queue_free)
	audio.play()
	
	queue_free()
