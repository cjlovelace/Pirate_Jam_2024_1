extends Node


var number_aliens = 24

var percent_corrupted = 0

var space_invaders_lost = false
var space_invaders_won = false
var space_invaders_paused = true

var space_invaders_has_triggered = false
var snake_has_triggered = false

var move_icons = false

var win_key = "3358x4598x1364x9904"
var current_key = "----x----x----x----"
var key_counter = 8

var game_won = false
var game_lost = false


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

func increment_key():
	
	if current_key != win_key:
		match(key_counter):
			8:
				current_key = "33--x----x----x----"
			7:
				current_key = "3358x----x----x----"
			6: 
				current_key = "3358x45--x----x----"
			5:
				current_key = "3358x4598x----x----"
			4:
				current_key = "3358x4598x13--x----"
			3: 
				current_key = "3358x4598x1364x----"
			2:
				current_key = "3358x4598x1364x99--"
			1:
				current_key = "3358x4598x1364x9904"
		key_counter -= 1
	else:
		game_won = true
