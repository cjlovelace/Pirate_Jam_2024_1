extends KinematicBody2D

class_name Ball

const VELOCITY_LIMIT = 40

export var ball_speed = 20
export var lives = 3

var speed_up_factor = 1.05

onready var collision_shape_2d = $CollisionShape2D

var start_position: Vector2

func _ready():
	start_position = position

func start_ball():
	position = start_position
	randomize()
	
	var velocity = Vector2(rand_range(-1, 1), rand_range(-.1, -1)).normalized()
	
