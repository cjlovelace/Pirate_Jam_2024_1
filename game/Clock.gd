extends Label


var time = Time.get_time_dict_from_system()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time = Time.get_time_dict_from_system()
	var twelve_hour_clock
	var hour
	if time.hour < 12:
		twelve_hour_clock = "AM"
		hour = time.hour
	else:
		twelve_hour_clock = "PM"
		hour = time.hour - 12
	
	text = str(hour) + ":%02d"% [time.minute]+ " " + twelve_hour_clock

# var time = Time.get_time_dict_from_system() (for later, I have ideas for virus effects)
