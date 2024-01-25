extends Area2D

#this is the script for the aliens bullet I just dont know how to rename things

func _physics_process(delta):
	position.y += 2
	



func _on_Shot_body_entered(body):
	if body.name == "Ship":
		global.set_space_invaders_lost(true)
		var current = global.get_percent_corrupted()
		global.set_percent_corrupted(current + 10)
	if body.name == "Shot":
		queue_free()
	if body.name == "Wall":
		queue_free()
