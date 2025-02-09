extends Area2D
class_name HitboxComponent

@export var healthComponent : HealthComponent

var timer = null

func _ready():
	timer = Timer.new()
	timer.set_one_shot(false)
	timer.set_wait_time(0.25)
	timer.timeout.connect(func(): damage(1))
	add_child(timer)

func damage(attack: int):
	if healthComponent:
		healthComponent.damage(attack)

func _on_area_entered(area):
	damage(1)
	timer.start()

func _on_area_exited(area):
	timer.stop()
