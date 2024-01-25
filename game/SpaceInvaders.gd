extends WindowDialog

onready var gameOverScreen = get_node("GameOverScreen")
onready var gameWonScreen = get_node("WinScreen")
onready var wall1 = get_node("Wall")
onready var wall2 = get_node("Wall2")
onready var walltop = get_node("Wall3")

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
		global.set_number_aliens(24)
		var current = global.get_percent_corrupted()
		if current < 10:
			global.set_percent_corrupted(0)
		else:
			global.set_percent_corrupted(current - 10)

	if global.get_percent_corrupted() >= 50:
		if is_instance_valid(wall1):
			wall1.queue_free()
		if is_instance_valid(wall2):
			wall2.queue_free()
	if global.get_percent_corrupted() >= 60:
		if is_instance_valid(walltop):
			walltop.queue_free()
