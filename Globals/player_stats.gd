extends Node

signal score_changed(score)

var attack_speed = 5.0
var move_speed = 0.3
var decceleration = 15
var acceleration = 40

var score: int = 0:
	set(value):
		score = value
		score_changed.emit(score)
