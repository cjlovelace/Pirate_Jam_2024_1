extends Node2D

func _process(delta):
	var current = global.get_percent_corrupted()
	global.set_percent_corrupted(current + delta/3)
