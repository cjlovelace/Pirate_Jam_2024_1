extends WindowDialog


func _process(delta):

	if global.get_number_aliens() == 0:
		print("You won space invaders")
