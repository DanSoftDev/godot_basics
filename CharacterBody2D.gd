extends CharacterBody2D

@export var speed = 300
@export var jumpForce = 150
@export var gravity = 200
@export var jumpHeight = 65

var timeJumpApex = 0.35
var onGround = false


func _physics_process(delta):
	gravity = (2*jumpHeight) / pow(timeJumpApex,2)
	jumpForce = gravity * timeJumpApex
	
	velocity.y += gravity * delta
	
	# Horizontal Movements
	if Input.is_action_pressed("Left"):
		velocity.x = -speed
	elif Input.is_action_pressed("Right"):
		velocity.x = speed
	else:
		velocity.x = 0
		
	# Jump Movement
	if Input.is_action_pressed("Jump"):
		if onGround:
			velocity.y = -jumpForce
			onGround = false
	
		
	if is_on_floor():
		onGround = true
		
	move_and_slide()
