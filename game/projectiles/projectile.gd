class_name Projectile
extends Area2D

@export var speed : float
@export var damage : int


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position += transform.x*speed*delta


func _on_body_entered(body):
	print(body)
	if body.is_in_group("enemy"):
		print("Is enemy")
		body.take_damage(damage)
