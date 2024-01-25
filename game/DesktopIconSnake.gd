extends TextureRect

class_name DesktopSnake

export (Texture) var idle_texture
export (Texture) var hover_texture
export (Texture) var click_texture

var MouseOver = false
onready var popup = get_node("SnakeDialog")

func _ready():
	texture = idle_texture
	popup.popup_exclusive = true

func _on_Snake_mouse_entered():
	MouseOver = true

func _on_Snake_mouse_exited():
	MouseOver = false

func _input(event):
	if event is InputEventMouseButton and event.doubleclick and event.button_index == BUTTON_LEFT:
		if MouseOver:
			popup.popup_centered()
