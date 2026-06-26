extends CharacterBody2D
@onready var target = $"../../Player"

var speed = 100

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
#func _physics_process(delta: float) -> void:
	#var direction = (target.position - position).normalized()
	#velocity = direction * speed
	#look_at(target.position)
	#move_and_slide()


	



	



	
