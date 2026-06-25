extends RigidBody2D

var THRUST_AMOUNT = 40.0
var screen_size
var rotation_speed = 10.0
var contact_count = 0
var is_touching_boundary = false

# TODO: Start scene with fan spinning
# TODO: -- IMPORTANT -- Fix bug when fan is in corner
func _ready():
	screen_size = get_viewport_rect().size
	linear_damp = 5
	angular_damp = 5
	contact_monitor = true
	max_contacts_reported = 4
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

# TODO: Simplify body_entered. Perhaps I can only use a body entered and the is in group property
func _on_body_entered(body: Node) -> void:
	is_touching_boundary = true

func _on_body_exited(body: Node) -> void:
	is_touching_boundary = false
	
func _physics_process(delta: float) -> void:
	# Tilting Mechanic
	if Input.is_action_pressed("tilt_right"):
		apply_torque_impulse(rotation_speed)	
	if Input.is_action_pressed("tilt_left"):
		apply_torque_impulse(-rotation_speed)	
	# So players don't get stuck on the ground
	if is_touching_boundary:
		rotation_speed = 150
	else:
		rotation_speed = 10.0
		
	# Flying
	if Input.is_action_pressed("fly"):
		apply_impulse(Vector2(0, -1).rotated(rotation) * THRUST_AMOUNT)
		$AnimatedSprite2D.play("fly")
	
	if Input.is_action_just_released("fly"):
		$AnimatedSprite2D.stop()
	
	print(linear_velocity)
	print("ROTATION_SPEED: ", rotation_speed)
	print("ANGULAR_DAMP: ", angular_damp)
	print("THRUST_AMOUNT:", THRUST_AMOUNT)
