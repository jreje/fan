extends CharacterBody2D

const FLY_VELOCITY = 100.0
var screen_size
var rotation_speed = 500.0
var move_speed = 50.0

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	position = position.clamp(Vector2.ZERO, screen_size)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Tilting Mechanic
	if Input.is_action_pressed("tilt_left"):
		global_rotation_degrees -= rotation_speed * delta;
	if Input.is_action_pressed("tilt_right"): 
		global_rotation_degrees += rotation_speed * delta;
	# Flying
	if Input.is_action_pressed("fly"):
		# TODO: Make sure if facing down, we have velocity and gravity compounded
		velocity = Vector2(0, -100).rotated(rotation) * FLY_VELOCITY * delta
		$AnimatedSprite2D.play("fly")
	
	if Input.is_action_just_released("fly"):
		$AnimatedSprite2D.stop()
	move_and_slide()
