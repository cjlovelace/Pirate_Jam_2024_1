extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if global.get_percent_corrupted() >= 20 && global.get_percent_corrupted() < 60:
		text = "Emoclew"
	if global.get_percent_corrupted() >= 60:
		text = "HeLp mE"