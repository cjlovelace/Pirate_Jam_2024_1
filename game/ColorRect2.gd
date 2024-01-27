extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self_modulate.a = 0



func _process(delta):
	if global.get_percent_corrupted() >=10:
		self_modulate.a = 0.1
	if global.get_percent_corrupted() >=20:
		self_modulate.a = 0.2
	if global.get_percent_corrupted() >=30:
		self_modulate.a = 0.3
	if global.get_percent_corrupted() >=40:
		self_modulate.a = 0.4
	if global.get_percent_corrupted() >=50:
		self_modulate.a = 0.5
	if global.get_percent_corrupted() >=60:
		self_modulate.a = 0.6
	if global.get_percent_corrupted() >=70:
		self_modulate.a = 0.7
	if global.get_percent_corrupted() >=80:
		self_modulate.a = 0.8
	if global.get_percent_corrupted() >=90:
		self_modulate.a = 0.9
