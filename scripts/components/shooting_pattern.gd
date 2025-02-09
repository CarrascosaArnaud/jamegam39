class_name ShootingPattern
extends Node2D

func _on_bullet_hit(result, bulletIndex, spawner):
	var health = result[0].collider as HealthComponent
	if (health):
		health.damage(1)
