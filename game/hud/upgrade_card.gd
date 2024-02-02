class_name UpgradeCard
extends Button



@export var upgrade : Upgrade
@export var title : Label
@export var desc : Label


func update_data():
	title.text = upgrade.title
	desc.text = upgrade.desc


func _on_pressed():
	if upgrade:
		GameManager.activate_upgrade(upgrade)
