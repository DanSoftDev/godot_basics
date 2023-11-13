extends CharacterBody2D
@onready var spr = $AnimatedSprite2D
var speed = 0
var maxSpeed = 300
# assets: https://grafxkid.itch.io/mini-pixel-pack-3
func _ready():
	spr.play("idle")
	pass
	
func _physics_process(_delta):
	if Input.is_action_pressed("Left"):
		spr.play("left")
	elif Input.is_action_pressed("Right"):
		spr.play("right")
	else: 
		spr.play("idle")
		
	if Input.is_action_pressed("forward"):
		if spr.flip_v:
			if velocity.y > 0:
				velocity.y -= 0.5
				speed = velocity.y
		if speed < maxSpeed:
			speed +=1
		velocity.y = -speed
		spr.flip_v = false
	elif Input.is_action_pressed("backward"):
		if !spr.flip_v:
			if self.velocity.y < 0:
				velocity.y += 0.5
				speed = velocity.y
		if speed < maxSpeed:
			speed +=1
		velocity.y = speed
		spr.flip_v = true
	else:
		if speed > 0:
			if velocity.y > 0:
				velocity.y -= 0.5
			if self.velocity.y < 0:
				velocity.y += 0.5
	move_and_slide()
