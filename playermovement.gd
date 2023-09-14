extends CharacterBody2D


@onready var _animation_player = $AnimatedSprite2D
@export var speed = 50

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animation_player.play("right")
	elif Input.is_action_pressed("ui_left"):
		_animation_player.play("left")
	elif Input.is_action_pressed("ui_down"):
		_animation_player.play("down")
	elif Input.is_action_pressed("ui_up"):
		_animation_player.play("up")
	else:
		_animation_player.stop()
func _physics_process(_delta):
	get_input()
	move_and_slide()
