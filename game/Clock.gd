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
		
	if global.get_percent_corrupted() >= 10:
		if twelve_hour_clock == "PM":
			twelve_hour_clock = "AM"
		else:
			twelve_hour_clock = "PM"
			
	text = str(hour) + ":%02d"% [time.minute]+ " " + twelve_hour_clock
	
	if global.get_percent_corrupted() >=30 && global.get_percent_corrupted() < 80:
		text = "6:66 " + twelve_hour_clock
	

# var time = Time.get_time_dict_from_system() (for later, I have ideas for virus effects)
