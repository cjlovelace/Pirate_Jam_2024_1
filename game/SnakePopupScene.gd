extends Node2D

var score : int
var winning_score : int = 3
var game_started : bool = false
var already_won : bool = false

#grid
var cells : int = 40
var cell_size : int = 25

#food
var food_pos: Vector2
var regen_food : bool = true

#snake
var old_data : Array
var snake_data : Array
var snake : Array

#movement
var start_pos = Vector2(250, 150)
var up = Vector2(0, -1)
var down = Vector2(0, 1)
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var move_direction: Vector2
var can_move: bool
var rng = RandomNumberGenerator.new()

func _ready():
	$SnakePopupTest.popup()
	new_game()

func new_game():
	score = 0
	generate_snake()
	move_food()
	move_direction = up
	can_move = true


func generate_snake():
	old_data.clear()
	snake_data.clear()
	snake.clear()
	
	for i in range(3):
		var new_sprite = Sprite.new()
		$SnakePopupTest/Sprite/SnakeBox.add_child(new_sprite)
		new_sprite.texture = load("res://SnakeSeg.png")
		new_sprite.position = Vector2(250, 150 + (i * cell_size))
		snake_data.append(new_sprite.position)
		snake.append(new_sprite)
		
func move_food():
	while regen_food:
		regen_food = false
		rng.randomize()
		food_pos = Vector2(rng.randi_range(20, 480), rng.randi_range(50, 295))
		print(food_pos)
		for i in snake_data:
			if food_pos == i:
				regen_food = true
	$SnakePopupTest/Sprite/SnakeBox/Food.position = food_pos
	regen_food = true
	
func _process(_delta):
	move_snake()

func move_snake():
	print(snake_data[0])
	if can_move and score < winning_score:
		if Input.is_action_just_pressed("move_down") and move_direction != up:
			move_direction = down
			can_move = false
			if not game_started:
				start_game()
		elif Input.is_action_just_pressed("move_up") and move_direction != down:
			move_direction = up
			can_move = false
			if not game_started:
				start_game()
		elif Input.is_action_just_pressed("move_left") and move_direction != right:
			move_direction = left
			can_move = false
			if not game_started:
				start_game()
		elif Input.is_action_just_pressed("move_right") and move_direction != left:
			move_direction = right
			can_move = false
			if not game_started:
				start_game()

func start_game():
	game_started = true
	$MoveTimer.start()

func _on_MoveTimer_timeout():
	can_move = true
	old_data = [] + snake_data
	snake_data[0] += move_direction
	for i in range(len(snake_data)):
		if i > 0:
			snake_data[i] = old_data[i - 1]
		snake[i].position = (snake_data[i] * cell_size) + Vector2(0, cell_size)
	
	
