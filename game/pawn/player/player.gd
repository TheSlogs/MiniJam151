class_name Player
extends Pawn



@export_category("Player Stats")
@export var upgrades : Upgrade
var fireball_scene = preload("res://game/projectiles/projectile.tscn")

func _ready():
	
	pass

func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("attack") :
		attack()
	var input : Vector2
	input = Input.get_vector("left","right","up","down").normalized()
	velocity = input*speed
	move_and_slide()
	pass

func attack():
	var fireball : Projectile = fireball_scene.instantiate() 
	fireball.rotation = rotation
	fireball.global_position = $Mouth.global_position
	BulletManager.add_child(fireball)
	
	pass
