extends CharacterBody2D
@onready var target = $"../../Player"

var speed = 50
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var direction = (target.position - position).normalized()
	velocity = direction * speed
	look_at(target.position)
	move_and_slide()

	



	
