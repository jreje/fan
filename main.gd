extends Node

@export var plane_scene: PackedScene

func _ready() -> void:
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
