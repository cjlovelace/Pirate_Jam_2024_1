extends MenuButton

var popup

func _ready():
	popup = get_popup()
	popup.connect("id_pressed", self, "file_menu")
	
	
func file_menu(ID):
	print(popup.get_item_text(ID), " pressed")
	match ID:
		0:
			get_tree().change_scene("res://mainmenu.tscn")
		1:
			get_tree().quit()
