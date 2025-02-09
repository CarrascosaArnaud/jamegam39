extends HealthComponent

@export var enemy: Enemy
@export var opaque_shader: ShaderMaterial
@export var sprite: Sprite2D

func _ready() -> void:
	health = 200

func damage(attack: int):
	super(attack)
	
	sprite.material = opaque_shader
	await get_tree().create_timer(0.1).timeout
	sprite.material = null
	
	if (health <= 0):
		AudioManager.mob_death_sound.play()
		enemy.queue_free()
		get_tree().current_scene.inc_score()
