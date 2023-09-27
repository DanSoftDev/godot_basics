extends CharacterBody2D

@onready var spr = $AnimatedSprite2D
@export var speed =250
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
		spr.play("Run")
		spr.flip_h = true
	elif Input.is_action_pressed("Right"):
		velocity.x = speed
		spr.play("Run")
		spr.flip_h = false
	else:
		velocity.x = 0
		spr.play("Idle")
		
	# Jump Movement
	if Input.is_action_pressed("Jump"):
		if onGround:
			velocity.y = -jumpForce
			onGround = false
	
	if !onGround:
		spr.play("Jump")	
	
		
	if is_on_floor():
		onGround = true
		
	move_and_slide()
	



