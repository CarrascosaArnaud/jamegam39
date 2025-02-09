extends Node2D
class_name HealthComponent

@export var MAX_HEALTH: float = 10.0

var health : float

func _ready():
	health = MAX_HEALTH

func damage(attack: int):	
	health -= attack
	print(get_parent().name, " a ", health, " pv restants")
