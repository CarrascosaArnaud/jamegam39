extends Node2D
class_name HealthComponent

signal player_dead

@export var MAX_HEALTH := 10.0
var health : float

func _ready():
	health = MAX_HEALTH

func damage(attack: int):
	health -= attack
	print(get_parent().name," a " , health, " pv restants")
	
	if health <= 0:
		print(get_parent().name, " est mort")
		player_dead.emit()
		health = 10
