extends Control


@export var world : PackedScene


func _on_start_button_pressed():
	get_tree().change_scene_to_packed(world)

