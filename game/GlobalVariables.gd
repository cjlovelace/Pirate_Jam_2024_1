extends Node


var number_aliens = 24

var percent_corrupted = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
\
func get_number_aliens():
	return number_aliens
	
func set_number_aliens(var x):
	number_aliens = x

func get_percent_corrupted():
	return percent_corrupted
	
func set_percent_corrupted(var x):
	percent_corrupted = x
