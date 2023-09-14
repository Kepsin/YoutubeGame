extends CharacterBody2D

var speed = 5
var playerchase = false
var player = null
# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])

func _physics_process(_delta):
	if(playerchase):
		position += (player.position - position)/speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
	
func _on_area_2d_body_entered(body):
	player = body
	playerchase = true

func _on_area_2d_body_exited(_body):
	player = null
	playerchase = false
