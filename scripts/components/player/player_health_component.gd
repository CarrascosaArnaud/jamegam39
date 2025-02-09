class_name PlayerHealthComponent
extends HealthComponent

signal player_dead

@onready var sprite: Sprite2D = $"../Sprite2D"

@export var INVINCIBILITY_TIME: float = 1.0

const INVINCIBILITY_ALPHA = 0.25

var timer_invincibility: Timer
var timer_invincibility_blink: Timer
var is_invincible: bool

func _ready() -> void:
	super()
	timer_invincibility = Timer.new()
	timer_invincibility.set_wait_time(1)
	timer_invincibility.set_one_shot(true)
	timer_invincibility.timeout.connect(func(): set_invincible(false))
	add_child(timer_invincibility)
	
	timer_invincibility_blink = Timer.new()
	timer_invincibility_blink.set_one_shot(false)
	timer_invincibility_blink.set_wait_time(0.1)
	timer_invincibility_blink.timeout.connect(invincible_blink)
	add_child(timer_invincibility_blink)

func invincible_blink():
	if (abs(sprite.modulate.a - INVINCIBILITY_ALPHA) <= 0.05):
		sprite.modulate.a = 1
	else:
		sprite.modulate.a = INVINCIBILITY_ALPHA

func set_invincible(new_is_invincible: bool):
	print("Is invincible : ", new_is_invincible)
	is_invincible = new_is_invincible
	if (is_invincible):
		timer_invincibility_blink.start()
	else:
		timer_invincibility_blink.stop()
		sprite.modulate.a = 1

func damage(attack: int):
	if (is_invincible):
		return
	
	set_invincible(true)
	timer_invincibility.start()
	
	super(attack)
	
	if health <= 0:
		print(get_parent().name, " est mort")
		player_dead.emit()
		health = 10
