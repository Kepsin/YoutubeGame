extends Node2D

var next_scene = null

var spawn_position

func _ready():
	$Transition/Fade.play("FadeBack")

func transition_to_scene(new_scene: String, new_position: Vector2):
	next_scene = new_scene
	spawn_position = new_position
	$Transition/Fade.play("Fade")
	

func fade_to_normal():
	$CurrentScene.get_child(0).queue_free()
	var tempLoad = load(next_scene)
	get_node(NodePath("/root/Scenemanager/Player")).position = spawn_position
	$CurrentScene.add_child(tempLoad.instantiate())
	
	$Transition/Fade.play("FadeBack")
