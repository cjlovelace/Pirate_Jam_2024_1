extends WindowDialog

onready var gameOverScreen = get_node("GameOverScreen")
onready var gameWonScreen = get_node("WinScreen")

func _process(delta):
	
	if global.get_space_invaders_lost():
		gameOverScreen.visible = true
	else:
		gameOverScreen.visible = false
		
	if global.get_space_invaders_won():
		gameWonScreen.visible = true
	else:
		gameWonScreen.visible = false


	if global.get_number_aliens() == 0:
		global.set_space_invaders_won(true)
