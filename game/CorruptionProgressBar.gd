extends ProgressBar




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	value = global.get_percent_corrupted()
