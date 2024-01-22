extends KinematicBody2D

var velocity = Vector2()
var speed


# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 250

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	
	if right:
		velocity.x = speed
	if left:
		velocity.x = -speed

func _process(delta):
	
	get_input()
	
	velocity = move_and_slide(velocity, Vector2(0, -1))
