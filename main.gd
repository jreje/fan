extends Node

@export var plane_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var plane = plane_scene.instantiate()
	var plane_spawn_location = $PlanePath/PlaneSpawnLocation
	plane_spawn_location.progress_ratio = randf()
	
	plane.position = plane_spawn_location.position
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	#plane.linear_velocity = velocity.rotated(direction)
	
	add_child(plane)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
