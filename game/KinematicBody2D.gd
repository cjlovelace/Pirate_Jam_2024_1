extends KinematicBody2D

#this is the script for the aliens, I just dont know how to rename files in Godot
var move_speed = 10


var shootingcount = rand_range(0,50)

func _physics_process(delta):
	var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	
	shootingcount += delta
	if shootingcount >= 50:
		var bullet = preload("res://AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x,position.y)
		get_parent().call_deferred("add_child", firedbullet)
		
		shootingcount = rand_range(0,50)
		
	if collision and collision.collider.has_method("wall_identifier"):
		hit_wall()
		
func kill():
	var previous = global.get_number_aliens()
	global.set_number_aliens(previous - 1)
	queue_free()

func hit_wall():
	global.set_space_invaders_lost(true)
	var current = global.get_percent_corrupted()
	global.set_percent_corrupted(current + 10)
	queue_free()
