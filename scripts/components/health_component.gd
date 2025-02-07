extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 10.0
var health : float

func _ready():
	health = MAX_HEALTH

func damage(attack: Attack):
	health -= attack.attackDamage
	print(get_parent().name," a " , health, " pv restants")
	
	if health <= 0:
		print(get_parent().name, " est mort")
		get_parent().queue_free()
