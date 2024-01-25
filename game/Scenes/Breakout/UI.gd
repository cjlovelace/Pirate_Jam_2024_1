extends CanvasLayer

class_name UI

onready var ui = $"%UI"
onready var lives = $"%Lives"

func set_lives(lives):
	lives.TextEdit = "Lives: %d" % lives
