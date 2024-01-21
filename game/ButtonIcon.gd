extends Button

class_name Icon

export (Icon) var idle_texture
export (Icon) var hover_texture
export (Icon) var click_texture

var MouseOver = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Icon = idle_texture

func _on_TextureRect_mouse_entered():
	MouseOver = true

func _on_TextureRect_mouse_exited():
	MouseOver = false
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if MouseOver:
			print("Icon Clicked")

