extends Area2D
class_name HitboxComponent

@export var healthComponent : HealthComponent

func damage(attack: int):
	if healthComponent:
		healthComponent.damage(attack)


func _on_area_entered(area):
	damage(1)
