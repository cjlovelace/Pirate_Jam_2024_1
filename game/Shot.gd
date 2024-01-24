extends KinematicBody2D

var Move_Speed = 300
var life_time = 2
var life_spawn = 0

func _process(delta):
	var collision = move_and_collide(Vector2.UP * delta * Move_Speed)
	
	if collision and collision.collider.has_method("kill"):
		collision.collider.kill()
		
	if collision:
		queue_free()

	life_spawn += delta
	if life_spawn > life_time:
		queue_free()
