extends TextureRect

class_name DesktopIcon

export (Texture) var idle_texture
export (Texture) var hover_texture
export (Texture) var click_texture

var MouseOver = false
onready var popup = get_node("Window1")

# Called when the node enters the scene tree for the first time.
func _ready():
	texture = idle_texture

func _on_TextureRect_mouse_entered():
	MouseOver = true

func _on_TextureRect_mouse_exited():
	MouseOver = false
	
func _input(event):
	if event is InputEventMouseButton and event.doubleclick and event.button_index == BUTTON_LEFT:
		if MouseOver:
			print("Icon Clicked")
			popup.popup_centered()

