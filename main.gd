extends Node

@export var plane_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	
	
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	#plane.linear_velocity = velocity.rotated(direction)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
