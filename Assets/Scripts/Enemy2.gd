extends RigidBody2D

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("Player Hit!")
		queue_free()
