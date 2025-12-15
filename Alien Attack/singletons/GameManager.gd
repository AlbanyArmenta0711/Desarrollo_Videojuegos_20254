extends Node

var score: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0 
	
func on_enemy_destroy():
	score += 1
	SignalManager.on_score_update.emit(score)
	
	
