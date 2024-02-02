class_name Player
extends Pawn



@export_category("Player Stats")
@export var upgrade : Upgrade


var fireball_scene = preload("res://game/projectiles/projectile.tscn")


func _ready():
	pass


func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("attack"):
		attack()
	
	var input : Vector2
	input = Input.get_vector("left","right","up","down").normalized()
	velocity = input * (speed + upgrade.speed + greedy_upgrade.speed)
	move_and_slide()


func attack():
	var fireball : Projectile = fireball_scene.instantiate()
	fireball.rotation = rotation
	fireball.global_position = $Mouth.global_position
	fireball.damage = base_damage + upgrade.damage + greedy_upgrade.damage
	fireball.speed += upgrade.projectile_speed + greedy_upgrade.projectile_speed
	BulletManager.add_child(fireball)
