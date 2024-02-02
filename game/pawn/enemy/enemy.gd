class_name Enemy
extends Pawn

signal enemy_died(xp_amount)

@export var target : Pawn
@export var drop_xp : int


func _ready():
	connect("enemy_died", GameManager._enemy_died)



func die():
	print("Dying")
	emit_signal("enemy_died", drop_xp)
	queue_free()
