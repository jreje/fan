extends CharacterBody2D
@onready var target = $"../../Player"

var speed = 100
var direction = 1
@onready var ray_cast_right = $Ray_Cast_Right
@onready var ray_cast_left = $Ray_Cast_Left


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
#func _physics_process(delta: float) -> void:
	#var direction = (target.position - position).normalized()
	#velocity = direction * speed
	#look_at(target.position)
	#move_and_slide()
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
		
	position.x += direction * speed * delta


	



	



	
