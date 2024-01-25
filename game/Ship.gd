extends KinematicBody2D

export var y_axis_adjustment : int = 0

var speed = 250
var velocity = Vector2()

func _physics_process(delta):
	
	if global.get_percent_corrupted() < 70:
		if Input.is_action_just_pressed("ui_left"):
			print("left")
			velocity.x = -speed
		if Input.is_action_just_pressed("ui_right"):
			print("right")
			velocity.x = speed
	else: 
		if Input.is_action_just_pressed("ui_left"):
			print("left")
			velocity.x = speed
		if Input.is_action_just_pressed("ui_right"):
			print("right")
			velocity.x = -speed
		
	move_and_slide(velocity)
	
	if Input.is_action_just_pressed("ui_fire"):
		print("shots fired")
		fire()
	
	
		


func fire():
	var bullet = preload("res://bulletSpaceInvader.tscn")
	var firedbullet = bullet.instance()
	firedbullet.position = Vector2(position.x,0)
	get_parent().call_deferred("add_child",firedbullet)

