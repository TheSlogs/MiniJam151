extends Control


signal start_upgrade
signal stop_upgrade


@export_category("Nodes")
@export var upgrade_container : HBoxContainer
@export var card1 : UpgradeCard
@export var card2 : UpgradeCard
@export var card3 : UpgradeCard


@export_category("Resources")
@export var greedy_upgrade : Upgrade
@export var player_upgrade : Upgrade
@export var upgrade_array : Array[Upgrade] = []



func _ready():
	update_debug()
	GameManager.connect("start_upgrade", _start_upgrade)
	GameManager.connect("stop_upgrade", _stop_upgrade)


func update_debug():
	$Debug/VBoxContainer/GHealth.text = "Health: " + str(greedy_upgrade.health)
	$Debug/VBoxContainer/GDamage.text = "Damage:" + str(greedy_upgrade.damage)
	$Debug/VBoxContainer/GSpeed.text = "Speed: " + str(greedy_upgrade.speed)
	$Debug/VBoxContainer/GAttackSpeed.text = "Attack Speed: " + str(greedy_upgrade.attack_speed)
	$Debug/VBoxContainer/GProjSpeed.text = "Projectile Speed: " + str(greedy_upgrade.projectile_speed)
	$Debug/VBoxContainer/PHealth.text = "Health: " + str(player_upgrade.health)
	$Debug/VBoxContainer/PDamage.text = "Damage:" + str(player_upgrade.damage)
	$Debug/VBoxContainer/PSpeed.text = "Speed: " + str(player_upgrade.speed)
	$Debug/VBoxContainer/PAttackSpeed.text = "Attack Speed: " + str(player_upgrade.attack_speed)
	$Debug/VBoxContainer/PProjSpeed.text = "Projectile Speed: " + str(player_upgrade.projectile_speed)


func _start_upgrade():
	shuffle_cards()
	upgrade_container.visible = true


func _stop_upgrade():
	upgrade_container.visible = false


func _on_upgrade_box_pressed():
	if GameManager.xp >= 10:
		card1._on_pressed()
		update_debug()
		GameManager.xp -= 10
		print("Current Money: " + str(GameManager.xp))


func _on_upgrade_box_2_pressed():
	if GameManager.xp >= 10:
		card2._on_pressed()
		update_debug()
		GameManager.xp -= 10
		print("Current Money: " + str(GameManager.xp))


func _on_upgrade_box_3_pressed():
	if GameManager.xp >= 10:
		card3._on_pressed()
		update_debug()
		GameManager.xp -= 10
		print("Current Money: " + str(GameManager.xp))


func shuffle_cards():
	upgrade_array.shuffle()
	card1.upgrade = upgrade_array[0]
	card2.upgrade = upgrade_array[1]
	card3.upgrade = upgrade_array[2]
	
	card1.update_data()
	card3.update_data()
	card2.update_data()
	
