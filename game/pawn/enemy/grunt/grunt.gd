extends Enemy


func _physics_process(delta):
	if target:
		look_at(target.global_position)
		




