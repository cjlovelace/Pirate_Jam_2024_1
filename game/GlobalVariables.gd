extends Node


var number_aliens = 24


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
