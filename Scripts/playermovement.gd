extends CharacterBody2D


@onready var _animation_player = $AnimatedSprite2D
@export var speed = 75
var last_direction

func _ready():
	_animation_player.play("idle_down")
	

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if (Input.is_action_pressed("sprint")):
		velocity = input_direction * (speed * 2)
	
	else:
		velocity = input_direction * speed
	player_animate (input_direction)
	
		


func player_animate(direction):
	match(direction):
		Vector2(1,0):
			if (velocity != Vector2(0,0) && Input.is_action_pressed("sprint")):
				_animation_player.play("run_right")
				last_direction = direction
			elif (velocity != Vector2(0,0)):
				_animation_player.play("right")
				last_direction = direction
		Vector2(-1,0):
			if (velocity != Vector2(0,0) && Input.is_action_pressed("sprint")):
				_animation_player.play("run_left")
				last_direction = direction
			elif (velocity != Vector2(0,0)):
				_animation_player.play("left")
				last_direction = direction
		Vector2(0,-1):
			if (velocity != Vector2(0,0) && Input.is_action_pressed("sprint")):
				_animation_player.play("run_up")
				last_direction = direction
			elif (velocity != Vector2(0,0)):
				_animation_player.play("up")
				last_direction = direction
		Vector2(0,1):
			if (velocity != Vector2(0,0) && Input.is_action_pressed("sprint")):
				_animation_player.play("run_down")
				last_direction = direction
			elif (velocity != Vector2(0,0)):
				_animation_player.play("down")
				last_direction = direction
	if(!velocity):
		match(last_direction):
			Vector2(1,0):
				_animation_player.play("idle_right")
			Vector2(-1,0):
				_animation_player.play("idle_left")
			Vector2(0,-1):
				_animation_player.play("idle_up")
			Vector2(0,1):
				_animation_player.play("idle_down")
func _physics_process(_delta):
	get_input()
	move_and_slide()
