extends RigidBody2D


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	linear_velocity = Vector2(0, 1)
	


func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
