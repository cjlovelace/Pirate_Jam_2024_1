extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MenuButton_button_up():
	global.set_percent_corrupted(0)
	global.current_key = "----x----x----x----"
	get_tree().change_scene("res://mainmenu.tscn")
