extends RigidBody2D

@onready var spr = $AnimatedSprite2D
var speed = 0
@export var maxSpeed = 100
var xpos = 0
# assets: https://grafxkid.itch.io/mini-pixel-pack-3
func _ready():
	spr.play("idle")
	pass
	
func _physics_process(delta):
	if Input.is_action_pressed("Left"):
		spr.play("left")
		if spr.flip_v:
			xpos = -1
		else: 
			xpos = 1
	elif Input.is_action_pressed("Right"):
		spr.play("right")
		if spr.flip_v:
			xpos = 1
		else: 
			xpos = -1
	else: 
		spr.play("idle")
		xpos = 0
		
	if Input.is_action_pressed("forward"):
		if speed > -maxSpeed:
			speed -= 0.5
		self.linear_velocity = Vector2(0,speed)
		spr.flip_v = false
		
	if Input.is_action_pressed("backward"):
		if speed < maxSpeed:
			speed += 0.5
		spr.flip_v = true
		self.linear_velocity = Vector2(0,speed)
		
	move_and_collide(Vector2(xpos,1)*speed*delta)
		
	
