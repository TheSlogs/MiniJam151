class_name Projectile
extends Area2D

@export var speed : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position += transform.x*speed*delta
	
	pass