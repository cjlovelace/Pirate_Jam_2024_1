extends KinematicBody2D

class_name Ball

const VELOCITY_LIMIT = 40
var speed_up_factor = 1.05
export var ball_speed = 20
export var lives = 3
var velocity
var is_ball_started = false


onready var collision_shape_2d = $CollisionShape2D
var start_position: Vector2

func _ready():
	start_position = position
	
	if(is_ball_started):
		velocity = Vector2(rand_range(-1, 1), rand_range(-.1, -1)).normalized() * ball_speed
	

func _physics_process(delta):
	
	var collision
	if(is_ball_started):
		collision = move_and_collide(velocity * ball_speed * delta)
	
	if(!collision):
		return
	
	velocity = velocity.bounce(collision.normal)

func start_ball():
	is_ball_started = true
	position = start_position
	randomize()
	velocity = Vector2(rand_range(-1, 1), rand_range(-.1, -1)).normalized() * ball_speed
