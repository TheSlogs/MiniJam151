class_name DynamicCamera
extends Camera2D


@export var max_distance : int = 50


func _physics_process(delta):
	if get_local_mouse_position().length() <= max_distance:
		position = get_local_mouse_position()
