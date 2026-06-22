extends CharacterBody2D

const FLY_VELOCITY = 500.0
var screen_size
var rotation_speed = 500.0
var move_speed = 50.0
var direction 

# TODO: For the future, top of fan should naturally tilt left/right making it harder to fly
func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	direction = Input.get_axis("tilt_left", "tilt_right")
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Tilting Mechanic
	if direction:
		global_rotation_degrees += direction * rotation_speed * delta

	# Flying
	if Input.is_action_pressed("fly"):
		# TODO: Make sure if facing down, we have velocity and gravity compounded
		velocity = Vector2(0, -15).rotated(rotation) * FLY_VELOCITY * delta
		$AnimatedSprite2D.play("fly")
	
	if Input.is_action_just_released("fly"):
		velocity.x = direction * FLY_VELOCITY * delta * 0.25
		$AnimatedSprite2D.stop()
	move_and_slide()
	
	# TODO: Make player snap to ground. May need to ask for help on this
	# For now, have reduced screen size by half of the collisionshape's size
	position = position.clamp(Vector2.ZERO, screen_size - ($CollisionShape2D.shape.size /2))
