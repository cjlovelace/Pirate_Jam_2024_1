extends TextureRect

class_name DesktopIconSpaceInvaders

export (Texture) var idle_texture
export (Texture) var hover_texture
export (Texture) var click_texture

var MouseOver = false
onready var popup = get_node("SpaceInvaders")


# Called when the node enters the scene tree for the first time.
func _ready():
	texture = idle_texture
	popup.popup_exclusive = true

func _on_TextureRect_mouse_entered():
	MouseOver = true

func _on_TextureRect_mouse_exited():
	MouseOver = false
	
func _input(event):
	if event is InputEventMouseButton and event.doubleclick and event.button_index == BUTTON_LEFT:
		if MouseOver:
			print("Icon Clicked")
			popup.popup_centered()
			global.set_number_aliens(24)
			global.set_space_invaders_lost(false)
			global.set_space_invaders_won(false)


func _on_SpaceInvaders_popup_hide():
	global.set_space_invaders_lost(false)
	global.set_space_invaders_won(false)
	get_tree().reload_current_scene()
