extends KinematicBody2D

var velocity = Vector2()
var speed
var is_ball_started = false

onready var ball = $"../Ball" as Ball

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 350

func _physics_process(delta):
	velocity.y = 0

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	
	if right:
		velocity.x = speed
	if left:
		velocity.x = -speed
	
	if velocity != Vector2.ZERO && !is_ball_started:
		ball.start_ball()
		is_ball_started = true

func _process(delta):
	
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))
