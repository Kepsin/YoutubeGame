extends Area2D

var level

@export var next_scene_path = ""

@export var spawn_position = Vector2(0,0)
	
func switch_scene():
	get_node(NodePath("/root/Scenemanager")).transition_to_scene(next_scene_path, spawn_position)
	
func _on_body_entered(_body):
	switch_scene() # Replace with function body.
