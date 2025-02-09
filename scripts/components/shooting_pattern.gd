class_name ShootingPattern
extends Node2D

func _on_bullet_hit(result, bulletIndex, spawner):
	print(result[0])
	if (result[0].collider as HealthComponent):
		(result[0].collider as HealthComponent).damage(1)
