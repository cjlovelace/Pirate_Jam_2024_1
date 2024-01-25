extends CanvasLayer

signal restart

func _on_SnakeRestartButton_button_up():
	emit_signal("restart")

