extends CanvasLayer

func _ready() -> void:
	get_tree().create_timer(2.4).timeout.connect(queue_free) 
