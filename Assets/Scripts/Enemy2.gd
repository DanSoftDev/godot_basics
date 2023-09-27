extends RigidBody2D

#Freeze rotation and angle
func _integrate_forces(state):
	angular_velocity = 0
	rotation_degrees = 0
	

# When some other object touch this one
func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("Player Hit")
