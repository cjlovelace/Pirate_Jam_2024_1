extends Area2D

#this is the script for the aliens bullet I just dont know how to rename things

func _physics_process(delta):
	position.y += 2
	



func _on_Shot_body_entered(body):
	if body.name == "Ship":
		global.set_space_invaders_lost(true)
	if body.name == "Shot":
		queue_free()
	if body.name == "Wall":
		queue_free()
