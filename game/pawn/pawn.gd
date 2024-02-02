class_name Pawn
extends CharacterBody2D


@export_category("Stats")
@export var max_health : int
@export var speed : float
@export var base_damage : int
@export var attack_speed : float
@export var greedy_upgrade : Upgrade


@onready var health : int = max_health



func take_damage(amount : int):
	health -= amount
	if health <= 0:
		die()


func die() -> void:
	pass
