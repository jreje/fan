extends RigidBody2D

const THRUST_AMOUNT = 100.0
var screen_size
var rotation_speed = 250.0

# TODO: For the future, top of fan should naturally tilt left/right making it harder to fly
func _ready():
	screen_size = get_viewport_rect().size
	linear_damp = 5

func _physics_process(delta: float) -> void:
	# Tilting Mechanic
	if Input.is_action_pressed("tilt_right"):
		apply_torque(400)	
	if Input.is_action_pressed("tilt_left"):
		apply_torque(-400)	
	# Tilting better, but now gets stuck into upside down position
		
	# Flying. Referenced this Repo https://github.com/Weetbix/moon-mishap/blob/main/scripts/player.gd 
	if Input.is_action_pressed("fly"):
		apply_force(Vector2(0, -15).rotated(rotation) * THRUST_AMOUNT)
		$AnimatedSprite2D.play("fly")
	
	if Input.is_action_just_released("fly"):
		$AnimatedSprite2D.stop()
	
	# TODO: Make player snap to ground. May need to ask for help on this
	# For now, have reduced screen size by half of the collisionshape's size
	# position = position.clamp(Vector2.ZERO, screen_size - ($CollisionShape2D.shape.size /2))
	
	print(linear_velocity)
