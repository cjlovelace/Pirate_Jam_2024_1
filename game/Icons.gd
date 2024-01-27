extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var my_array = [0,1,2,3]
	var rand_value = my_array[randi() % my_array.size()]
	var new_location = Vector2(50,50)
	
	match (rand_value):
		0:
			new_location = Vector2(50,50)
		1:
			new_location = Vector2(100,100)
		2:
			new_location = Vector2(25,200)
		3:
			new_location = Vector2(400,400)
	
	if global.move_icons && global.get_percent_corrupted() >= 80 && counter < 5:
		 set_position(new_location)
		 counter += 1
