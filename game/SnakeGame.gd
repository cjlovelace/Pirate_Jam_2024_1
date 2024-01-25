extends Node

export var snake_scene : PackedScene

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
var start_pos = Vector2(20,20)
var up = Vector2(0, -1)
var down = Vector2(0, 1)
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var move_direction: Vector2
var can_move: bool
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	get_tree().paused = false
	get_tree().call_group("segments", "queue_free")
	$SnakeGameOverMenu.hide()
	score = 0
	$Hud.get_node("ScoreLabel").text = "Score: " + str(score)
	move_direction = up
	can_move = true
	generate_snake()
	move_food()
	
func generate_snake():
	old_data.clear()
	snake_data.clear()
	snake.clear()
	
	for i in range(3):
		add_segment(start_pos + Vector2(0, i))
		
func add_segment(pos):
	snake_data.append(pos)
	var SnakeSegment = snake_scene.instance()
	SnakeSegment.position = (pos * cell_size) + Vector2(0, cell_size)
	add_child(SnakeSegment)
	snake.append(SnakeSegment)
	

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
	check_out_of_bounds()
	check_self_eaten()
	check_food_eaten()

func check_out_of_bounds():
	if snake_data[0].x < 1 or snake_data[0].x > 40 or snake_data[0].y < 1 or snake_data[0].y > 23:
		end_game()
		
func check_self_eaten():
	for i in range(1, len(snake_data)):
		if snake_data[0] == snake_data[i]:
			end_game()
			
func check_food_eaten():
	#if snake eats the food, add a segment and move the food
	if snake_data[0].x - 6 == food_pos.x and snake_data[0].y - 6 == food_pos.y:
		score += 1
		$Hud.get_node("ScoreLabel").text = "SCORE: " + str(score)
		add_segment(old_data[-1])
		if score < winning_score:
			move_food()
		else:
			already_won = true
			end_game()
		
func move_food():
	while regen_food:
		regen_food = false
		rng.randomize()
		food_pos = Vector2(rng.randi_range(1, 30), rng.randi_range(1, 16))
		print(food_pos)
		for i in snake_data:
			if food_pos == i:
				regen_food = true
	$Food.position = (food_pos * cell_size)+ Vector2(0, cell_size)
	regen_food = true

func end_game():
	$MoveTimer.stop()
	$SnakeGameOverMenu.show()
	game_started = false

func _on_SnakeGameOverMenu_restart():
	new_game()
	
