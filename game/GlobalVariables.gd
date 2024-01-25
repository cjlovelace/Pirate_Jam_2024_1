extends Node


var number_aliens = 24

var percent_corrupted = 0

var space_invaders_lost = false
var space_invaders_won = false
var space_invaders_paused = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_number_aliens():
	return number_aliens
	
func set_number_aliens(var x):
	number_aliens = x

func get_percent_corrupted():
	return percent_corrupted
	
func set_percent_corrupted(var x):
	percent_corrupted = x
	
func get_space_invaders_lost():
	return space_invaders_lost
	
func set_space_invaders_lost(var x):
	space_invaders_lost = x
	
func get_space_invaders_won():
	return space_invaders_won
	
func set_space_invaders_won(var x):
	space_invaders_won = x
