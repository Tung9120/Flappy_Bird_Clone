extends CharacterBody2D

class_name Bird

@export var gravity = 900.0
@export var jump_force = -300.0
@export var rotation_speed = 2

@onready var animation_player = $AnimationPlayer

var max_speed = 400

func _ready():
	velocity = Vector2.ZERO
	
func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		jump()
		
	velocity.y += gravity * delta
	
	velocity.y = min(velocity.y, max_speed)
	
	# if velocity.y > max_speed
	#	velocity.y = max_speed
	
	move_and_collide(velocity * delta)
	
	rotate_bird()
		
func jump():
	velocity.y = jump_force
	rotation = deg_to_rad(-30)
	
func rotate_bird():
	# Rotate downwards when falling
	if velocity.y > 0 && rad_to_deg(rotation) < 90:
		rotation += rotation_speed * deg_to_rad(1)
	elif velocity.y < 0 && rad_to_deg(rotation) > - 30:
		rotation -= rotation_speed * deg_to_rad(1)
	
	
