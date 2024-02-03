extends Node


signal enemy_died(xp_amount)
signal start_upgrade
signal stop_upgrade


@export var gold : int = 0
@export var xp : int = 0

@export var greedy_upgrade = preload("res://game/upgrades/greedy_upgrade.tres")
@export var player_upgrade = preload("res://game/upgrades/player_upgrade.tres")

var is_shop_open : bool = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


func _physics_process(delta):
	if Input.is_action_just_pressed("shop"):
		print("Current Money: " + str(xp))
		if !is_shop_open:
			choose_upgrade()
		else:
			_stop_upgrade()
		is_shop_open = !is_shop_open
		


func _enemy_died(xp_amount : int):
	xp += xp_amount
	print(xp)
	
	#if xp > 9:
	#	choose_upgrade()
	#	xp -= 9


func choose_upgrade():
	get_tree().paused = true
	emit_signal("start_upgrade")


func _stop_upgrade():
	get_tree().paused = false
	emit_signal("stop_upgrade")


func activate_upgrade(upg : Upgrade):
	if upg.type == 0:
		greedy_upgrade.health += upg.health
		greedy_upgrade.damage += upg.damage
		greedy_upgrade.speed += upg.speed
		greedy_upgrade.attack_speed += upg.attack_speed
		greedy_upgrade.projectile_speed += upg.projectile_speed
	else:
		player_upgrade.health += upg.health
		player_upgrade.damage += upg.damage
		player_upgrade.speed += upg.speed
		player_upgrade.attack_speed += upg.attack_speed
		player_upgrade.projectile_speed += upg.projectile_speed
