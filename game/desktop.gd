extends Node2D

func _process(delta):
	var current = global.get_percent_corrupted()
	global.set_percent_corrupted(current + delta/3)
	if(global.current_key == global.win_key):
		global.game_won = true
		get_tree().change_scene("res://winScreen.tscn")
	if(current >= 100):
		global.game_lost = true 
		get_tree().change_scene("res://loseScreen.tscn")
		
