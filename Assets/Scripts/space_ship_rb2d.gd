extends RigidBody2D
@onready var spr = $AnimatedSprite2D
var speed = 0
@export var maxSpeed = 100
var xpos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	spr.play("idle")
# Called every frame. 'delta' is the elapsed time since the previous frame.
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
		xpos = 0
		spr.play("idle")
		
	if Input.is_action_pressed("forward"):
		if speed > -maxSpeed:
			speed -= 0.5
		self.linear_velocity = Vector2(0,speed)
		spr.flip_v = false
	if Input.is_action_pressed("backward"):
		if speed < maxSpeed:
			speed += 0.5
		self.linear_velocity = Vector2(0,speed)
		spr.flip_v = true
		
	move_and_collide(Vector2(xpos,1)*speed*delta)
	
	
