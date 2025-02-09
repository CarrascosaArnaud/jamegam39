extends Node2D

func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = 2
	timer.autostart = true
	timer.timeout.connect(spawnEnemy)
	add_child(timer)

func spawnEnemy():
	$EnemyBuilder.generate_random_enemy()
