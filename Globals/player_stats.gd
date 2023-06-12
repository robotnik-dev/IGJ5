extends Node

signal score_changed(score)

var attack_speed = 2.0
var move_speed = 0.3

var bullet_damage: int = 1
var bullet_speed: float = 100.0
var bullet_size: float = 0.2
var enemy_speed: float = 0.1:
	set(value):
		enemy_speed = clampf(value, 0.1, 1.0)

var score: int = 0:
	set(value):
		score = value
		score_changed.emit(score)
		
		if score % 15 == 0:
			bullet_size += 0.01
		
		if score % 10 == 0:
			attack_speed += 0.5
		
		if score % 100 == 0:
			bullet_damage += 1
		
		if score % 25 == 0:
			enemy_speed += 0.1
